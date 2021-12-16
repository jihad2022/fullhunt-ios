//
//  FullHuntAppDelegate.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 16/12/2021.
//

import Foundation

protocol FullHuntAppDelegate: AnyObject {
    func getDomainDetailsEnded(with domain: Domain?, error: FullHuntError?)
    func getSubdomainDetailsEnded(with subdomain: Subdomain?, error: FullHuntError?)
    func getHostDetailsEnded(with host: Host?, error: FullHuntError?)
}
