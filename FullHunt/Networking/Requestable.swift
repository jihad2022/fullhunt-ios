//
//  Requestable.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 16/12/2021.
//

import Foundation
/**
 A protocol defines HTTP request's properties
 */
protocol Requestable {
    /// HTTP Request
    var request: URLRequest? { get }
    /// Request's URL session
    var session: URLSession { get }
}
