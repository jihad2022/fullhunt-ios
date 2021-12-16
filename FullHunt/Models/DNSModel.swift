//
//  DNSModel.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 16/12/2021.
//

import Foundation

// MARK: - DNS
struct DNS: Codable {
    let aaaa, mx, ns, txt, a, cname, ptr: [String]?
}
