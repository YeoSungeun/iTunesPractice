//
//  SearchViewModel.swift
//  iTunesPractice
//
//  Created by 여성은 on 8/12/24.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel {
    struct Input {
        let searchText: ControlProperty<String>
        let searchButtonTap: ControlEvent<Void>
    }
    struct Output {
        let searchResultList: BehaviorSubject<[SoftwareResult]>
    }
    let disposeBag = DisposeBag()
    func transform(input: Input) -> Output {
        let searchResultList = BehaviorSubject<[SoftwareResult]>(value: [])
        
        input.searchButtonTap
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .withLatestFrom(input.searchText)
            .distinctUntilChanged()
            .map { return "\($0)"}
            .flatMapLatest { value in
                NetworkManager.shared.callBoxOffice(term: value)
            }
            .subscribe(with: self, onNext: { owner, value in
                searchResultList.onNext(value.results)
            },onError: { owner, error in
                print("error : \(error)")
            }, onCompleted: { owner in
                print("completed")
            }, onDisposed: { owner in
                print("disposed")
            })
            .disposed(by: disposeBag)
        
        return Output(searchResultList: searchResultList)
    }
}


