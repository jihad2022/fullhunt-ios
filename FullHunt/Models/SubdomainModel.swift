//
//  SubdomainDetailsModel.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 16/12/2021.
//

import Foundation

// MARK: - SubdomainDetailsModel
struct Subdomain: Codable {
    let domain, message: String?
    let subdomains: [String]?
    let status: Int?
    let metadata: Metadata?
}
