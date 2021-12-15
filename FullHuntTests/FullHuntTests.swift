//
//  FullHuntTests.swift
//  FullHuntTests
//
//  Created by Jihad Mahmoud on 15/12/2021.
//

import XCTest
@testable import FullHunt

class FullHuntTests: XCTestCase {
    
    func testConfigureAppWithTokenAndAPIVersion() {
        let token = "testToken"
        let apiVersion = "v1"
        
        let configuration = FullHuntConfiguration(with: token, version: apiVersion)
        let fullHuntApp = FullHuntApp(with: configuration)
        
        XCTAssertEqual(fullHuntApp.appConfiguration.apiToken, token)
        XCTAssertEqual(fullHuntApp.appConfiguration.apiVersion, apiVersion)
    }
}
