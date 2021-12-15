//
//  FullHuntConfiguration.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 15/12/2021.
//

import Foundation
/**
 An object that manages your FullHuntApp configuration
 */
public class FullHuntConfiguration {
    
    /// API token provided in your FullHunt profile settings https://fullhunt.io/user/settings/
    let apiToken: String
    /// Targeted API version you want to use
    let apiVersion: String
    
    /**
    Create a configuration with API token and version
     - parameters:
        - token: the API token
        - version: the targeted API version
     */
    init(with token: String, version: String? = nil) {
        apiToken = token
        apiVersion = version ?? kBaseVersion
    }
}
