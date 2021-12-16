//
//  DomainDetailsModel.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 16/12/2021.
//

import Foundation

// MARK: - DomainDetailsModel
struct Domain: Codable {
    let domain, message: String?
    let hosts: [Host]?
    let status: Int?
    let metadata: Metadata?
}
