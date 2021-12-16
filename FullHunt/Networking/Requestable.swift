//
//  Requestable.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 16/12/2021.
//

import Foundation

protocol Requestable {
    var method: HTTPMethod { get }
    var url: URL? { get }
    var encoding: HTTPEncoding { get }
    var header: [String: String] { get }
}
