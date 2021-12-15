//
//  FullHuntConfiguration.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 15/12/2021.
//

import Foundation

public class FullHuntConfiguration {
    
    let apiToken: String
    let apiVersion: String
    
    init(with token: String, version: String) {
        apiToken = token
        apiVersion = version
    }
}
