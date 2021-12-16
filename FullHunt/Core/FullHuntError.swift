//
//  FullHuntError.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 16/12/2021.
//

import Foundation
/**
 An enum with FullHunt errors
 */
enum FullHuntError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFount
    case tooManyRequests
    case badResponse
    
    var description: String {
        switch self {
        case .badRequest:
            return "Your request is invalid."
        case .unauthorized:
            return "Your API key is wrong."
        case .forbidden:
            return "The requested resource is forbidden."
        case .notFount:
            return "The requested resource could not be found."
        case .tooManyRequests:
            return "You are sending too many requests."
        case .badResponse:
            return "The data is not in a correct format."
        }
    }
    
    var code: Int {
        switch self {
        case .badRequest:
            return 400
        case .unauthorized:
            return 401
        case .forbidden:
            return 403
        case .notFount:
            return 404
        case .tooManyRequests:
            return 429
        case .badResponse:
            return 500
        }
    }
}
