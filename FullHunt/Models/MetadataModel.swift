//
//  MetadataModel.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 16/12/2021.
//

import Foundation

// MARK: - Metadata
struct Metadata: Codable {
    let allResultsCount, availableResultsForUser, lastScanned, maxResultsForUser, timestamp: Int?
    let domain, userPlan: String?

    enum CodingKeys: String, CodingKey {
        case domain, timestamp
        case allResultsCount = "all_results_count"
        case availableResultsForUser = "available_results_for_user"
        case lastScanned = "last_scanned"
        case maxResultsForUser = "max_results_for_user"
        case userPlan = "user_plan"
    }
}
