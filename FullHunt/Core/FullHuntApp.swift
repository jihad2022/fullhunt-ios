//
//  FullHuntApp.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 15/12/2021.
//

import Foundation
/**
 An object to manage your FullHunt app
 */
public class FullHuntApp {
    
    /// The framework configuration required to start using it
    let appConfiguration: FullHuntConfiguration
    
    /**
     Create an app with the designated configuration
     - parameters:
        - configuration: the framework configuration
     */
    init(with configuration: FullHuntConfiguration) {
        appConfiguration = configuration
    }
}
