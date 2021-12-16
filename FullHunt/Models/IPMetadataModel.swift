//
//  IPMetadataModel.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 16/12/2021.
//

import Foundation

// MARK: - IPMetadata
struct IPMetadata: Codable {
    let asn: Int?
    let cityName, countryCode, countryName, isp, organization, postalCode, region: String?
    let locationLatitude, locationLongitude: Double?

    enum CodingKeys: String, CodingKey {
        case asn, isp, region, organization
        case cityName = "city_name"
        case countryCode = "country_code"
        case countryName = "country_name"
        case locationLatitude = "location_latitude"
        case locationLongitude = "location_longitude"
        case postalCode = "postal_code"
    }
}
