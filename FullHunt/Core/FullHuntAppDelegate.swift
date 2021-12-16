//
//  FullHuntAppDelegate.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 16/12/2021.
//

import Foundation

protocol FullHuntAppDelegate: AnyObject {
    func getDomainDetailsEnded(with domain: Domain?, error: FullHuntError?)
}
