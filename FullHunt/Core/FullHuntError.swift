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
    /// Invalid request
    case badRequest
    /// Invalid authorization token
    case unauthorized
    /// Invalid access to protected resources
    case forbidden
    /// Invalid access to unavailable resources
    case notFount
    /// Sending too many requests
    case tooManyRequests
    /// Invalid response returned
    case badResponse
    /// The request is nil
    case requestNotFound
    /// Generic error
    case generic(code: Int, description: String)
    
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
        case .requestNotFound:
            return "Request can not be nil."
        case .generic(_, let description):
            return description
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
        case .requestNotFound:
            return 499
        case .generic(let code, _):
            return code
        }
    }
}
