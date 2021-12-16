//
//  Router.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 16/12/2021.
//

import Foundation
/**
 An enum with FullHunt's requests routes
 */
enum Router: Requestable {
    
    case getDomainDetails(token: String, version: String, domain: String)
    case getSubdomains(token: String, version: String, domain: String)
    case getHostDetails(token: String, version: String, host: String)
    
    var request: URLRequest? {
        guard let url = url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
    
    var session: URLSession {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = sessionTimeOut
        config.timeoutIntervalForResource = sessionTimeOut
        config.httpAdditionalHeaders = header
        return URLSession(configuration: config)
    }
    
    private var encoding: HTTPEncoding {
        return .json
    }
    
    private var header: [String: String] {
        get {
            switch self {
            case .getDomainDetails(let token, _, _):
                return [
                    HeaderKey.apiKey.rawValue: token,
                    HeaderKey.contentType.rawValue: encoding.rawValue
                ]
            case .getSubdomains(let token, _, _):
                return [
                    HeaderKey.apiKey.rawValue: token,
                    HeaderKey.contentType.rawValue: encoding.rawValue
                ]
            case .getHostDetails(let token, _, _):
                return [
                    HeaderKey.apiKey.rawValue: token,
                    HeaderKey.contentType.rawValue: encoding.rawValue
                ]
            }
        }
    }
    
    private var method: HTTPMethod {
        return .get
    }
    
    private var url: URL? {
        return URL(string: baseURLString + path)
    }
    
    private var baseURLString: String {
        "https://fullhunt.io/"
    }
    
    private var path: String {
        switch self {
        case .getDomainDetails(_, let version, let domain):
            return "api/\(version)/domain/\(domain)/details"
        case .getSubdomains(_, let version, let domain):
            return "api/\(version)/domain/\(domain)/subdomains"
        case .getHostDetails(_, let version, let host):
            return "api/\(version)/host/\(host)"
        }
    }
    
    private var sessionTimeOut: Double {
        300.0
    }
}
