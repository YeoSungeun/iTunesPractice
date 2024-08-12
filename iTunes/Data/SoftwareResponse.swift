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
    let artworkUrl60, artworkUrl512, artworkUrl100: String
    let artistViewURL: String
    let isGameCenterEnabled: Bool
    let advisories: [String]
    let features: [Feature]
    let supportedDevices: [String]
    let kind: Kind
    let minimumOSVersion: String
    let averageUserRatingForCurrentVersion, averageUserRating: Double
    let trackCensoredName: String
    let languageCodesISO2A: [String]
    let fileSizeBytes: String
    let sellerURL: String?
    let formattedPrice: FormattedPrice
    let contentAdvisoryRating: Rating
    let userRatingCountForCurrentVersion: Int
    let trackViewURL: String
    let trackContentRating: Rating
    let releaseNotes: String
    let price, artistID: Int
    let artistName: String
    let genres: [String]
    let description, primaryGenreName: String
    let primaryGenreID: Int
    let bundleID: String
    let releaseDate: Date
    let genreIDS: [String]
    let trackID: Int
    let trackName, sellerName: String
    let isVppDeviceBasedLicensingEnabled: Bool
    let currentVersionReleaseDate: Date
    let currency: Currency
    let version: String
    let wrapperType: Kind
    let userRatingCount: Int

    enum CodingKeys: String, CodingKey {
        case screenshotUrls, ipadScreenshotUrls, appletvScreenshotUrls, artworkUrl60, artworkUrl512, artworkUrl100
        case artistViewURL = "artistViewUrl"
        case isGameCenterEnabled, advisories, features, supportedDevices, kind
        case minimumOSVersion = "minimumOsVersion"
        case averageUserRatingForCurrentVersion, averageUserRating, trackCensoredName, languageCodesISO2A, fileSizeBytes
        case sellerURL = "sellerUrl"
        case formattedPrice, contentAdvisoryRating, userRatingCountForCurrentVersion
        case trackViewURL = "trackViewUrl"
        case trackContentRating, releaseNotes, price
        case artistID = "artistId"
        case artistName, genres, description, primaryGenreName
        case primaryGenreID = "primaryGenreId"
        case bundleID = "bundleId"
        case releaseDate
        case genreIDS = "genreIds"
        case trackID = "trackId"
        case trackName, sellerName, isVppDeviceBasedLicensingEnabled, currentVersionReleaseDate, currency, version, wrapperType, userRatingCount
    }
}
