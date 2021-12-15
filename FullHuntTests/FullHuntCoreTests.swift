//
//  FullHuntTests.swift
//  FullHuntTests
//
//  Created by Jihad Mahmoud on 15/12/2021.
//

import XCTest
@testable import FullHunt

class FullHuntCoreTests: XCTestCase {
    
    var token: String? = nil
    var apiVersion: String? = nil
    
    override func setUp() {
        token = "testToken"
        apiVersion = "v1"
    }
    
    override func tearDown() {
        token = nil
        apiVersion = nil
    }
    
    func testConfigureAppWithTokenAndBaseVersion() {
        do {
            let token = try XCTUnwrap(token)
            let configuration = FullHuntConfiguration(with: token)
            let fullHuntApp = FullHuntApp(with: configuration)
            
            XCTAssertEqual(fullHuntApp.appConfiguration.apiToken, token)
            XCTAssertEqual(fullHuntApp.appConfiguration.apiVersion, kBaseVersion)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testConfigureAppWithTokenAndAPIVersion() {
        do {
            let token = try XCTUnwrap(token)
            let apiVersion = try XCTUnwrap(apiVersion)
            let configuration = FullHuntConfiguration(with: token, version: apiVersion)
            let fullHuntApp = FullHuntApp(with: configuration)
            
            XCTAssertEqual(fullHuntApp.appConfiguration.apiToken, token)
            XCTAssertEqual(fullHuntApp.appConfiguration.apiVersion, apiVersion)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
