//
//  SoftwareResponse.swift
//  iTunes
//
//  Created by 여성은 on 8/12/24.
//

import Foundation

struct SoftwareResponse: Decodable {
    let resultCount: Int
    let results: [SoftwareResult]
}

struct SoftwareResult: Decodable {
    let screenshotUrls: [String]
    let artworkUrl60: String
    let trackCensoredName: String // 앱이름
    let releaseNotes: String
    let description: String
    let sellerName: String // 회사명
    let genres: [String]
    let version: String
    
}
