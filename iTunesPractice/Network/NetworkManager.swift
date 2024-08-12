//
//  NetworkManager.swift
//  iTunes
//
//  Created by 여성은 on 8/12/24.
//

import Foundation
import RxSwift

enum APIError: Error {
    case invalidURL
    case unknownResponse
    case statusError
}

final class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
    func callBoxOffice(term: String) -> Observable<SoftwareResponse> {
        
        let url = "https://itunes.apple.com/search?term=\(term)&country=KR&media=software"
        
        let result = Observable<SoftwareResponse>.create { observer in
            guard let url = URL(string: url) else {
                observer.onError(APIError.unknownResponse)
                return Disposables.create()
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                // error 체크
                if let _ = error {
                    observer.onError(APIError.unknownResponse)
                    return
                }
                // response 체크
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    observer.onError(APIError.statusError)
                    return
                }
                // data디코딩
                if let data = data, let appData = try? JSONDecoder().decode(SoftwareResponse.self, from: data) {
                    print(appData)
                    observer.onNext(appData)
                    observer.onCompleted() // 끝났다고 알려주는! 이거를 한번에 하는게 있었는데...single!
                } else  {
                    print("응답 o / 디코딩 x")
                    observer.onError(APIError.unknownResponse)
                }
            }.resume()
            return Disposables.create()
        }
        return result
    }
}

