//
//  HostDetailsModel.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 16/12/2021.
//

import Foundation

// MARK: - Host
struct Host: Codable {
    let cdn, domain, tld, httpTitle, ipAddress, host: String?
    let cloud: Cloud?
    let dns: DNS?
    let hasIpv6, hasPrivateIP, isCDN, isCloud, isCloudflare, isLive, isResolvable: Bool?
    let httpStatusCode: Int?
    let ipMetadata: IPMetadata?
    let networkPorts: [Int]?
    let tags: [String]?

    enum CodingKeys: String, CodingKey {
        case cdn, cloud, dns, domain, host, tags, tld
        case hasIpv6 = "has_ipv6"
        case hasPrivateIP = "has_private_ip"
        case httpStatusCode = "http_status_code"
        case httpTitle = "http_title"
        case ipAddress = "ip_address"
        case ipMetadata = "ip_metadata"
        case isCDN = "is_cdn"
        case isCloud = "is_cloud"
        case isCloudflare = "is_cloudflare"
        case isLive = "is_live"
        case isResolvable = "is_resolvable"
        case networkPorts = "network_ports"
    }
}
