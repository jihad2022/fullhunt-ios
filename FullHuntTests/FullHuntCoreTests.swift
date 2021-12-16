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
            let fullHuntApp = getApp(with: token)
            
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
            let fullHuntApp = getApp(with: token, version: apiVersion)
            
            XCTAssertEqual(fullHuntApp.appConfiguration.apiToken, token)
            XCTAssertEqual(fullHuntApp.appConfiguration.apiVersion, apiVersion)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testGetDomainDetailsSuccess() {
        do {
            let token = try XCTUnwrap(token)
            let apiVersion = try XCTUnwrap(apiVersion)
            let fullHuntApp = getApp(
                with: token,
                version: apiVersion,
                serviceManager: ServiceManagerDomainSuccessMock()
            )
            
            let fullHuntSuccessDelegate = FullHuntSuccessDelegate()
            fullHuntApp.delegate = fullHuntSuccessDelegate
            
            fullHuntApp.getDomainDetails(for: "test.com")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testGetDomainDetailsFailure() {
        do {
            let token = try XCTUnwrap(token)
            let apiVersion = try XCTUnwrap(apiVersion)
            let fullHuntApp = getApp(
                with: token,
                version: apiVersion,
                serviceManager: ServiceManagerFailureMock()
            )
            
            let fullHuntFailedDelegate = FullHuntFailedDelegate()
            fullHuntApp.delegate = fullHuntFailedDelegate
            
            fullHuntApp.getDomainDetails(for: "test.com")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testGetSubdomainDetailsSuccess() {
        do {
            let token = try XCTUnwrap(token)
            let apiVersion = try XCTUnwrap(apiVersion)
            let fullHuntApp = getApp(
                with: token,
                version: apiVersion,
                serviceManager: ServiceManagerSubdomainSuccessMock()
            )
            
            let fullHuntSuccessDelegate = FullHuntSuccessDelegate()
            fullHuntApp.delegate = fullHuntSuccessDelegate
            
            fullHuntApp.getSubdomainDetails(for: "test.test.com")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testGetSubdomainDetailsFailed() {
        do {
            let token = try XCTUnwrap(token)
            let apiVersion = try XCTUnwrap(apiVersion)
            let fullHuntApp = getApp(
                with: token,
                version: apiVersion,
                serviceManager: ServiceManagerFailureMock()
            )
            
            let fullHuntFailedDelegate = FullHuntFailedDelegate()
            fullHuntApp.delegate = fullHuntFailedDelegate
            
            fullHuntApp.getSubdomainDetails(for: "test.test.com")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    private func getApp(
        with token: String,
        version: String? = nil,
        serviceManager: ServiceManagerProtocol? = nil
    ) -> FullHuntApp {
        let configuration = FullHuntConfiguration(with: token, version: version)
        guard let serviceManager = serviceManager else {
            return FullHuntApp(with: configuration)
        }
        return FullHuntApp(with: configuration, serviceManager: serviceManager)
    }
}

fileprivate class FullHuntSuccessDelegate: FullHuntAppDelegate {
    func getDomainDetailsEnded(with domain: Domain?, error: FullHuntError?) {
        XCTAssertNotNil(domain)
        XCTAssertEqual(domain?.domain, "test.com")
    }
    
    func getSubdomainDetailsEnded(with subdomain: Subdomain?, error: FullHuntError?) {
        XCTAssertNotNil(subdomain)
        XCTAssertEqual(subdomain?.domain, "test.test.com")
    }
}

fileprivate class FullHuntFailedDelegate: FullHuntAppDelegate {
    func getDomainDetailsEnded(with domain: Domain?, error: FullHuntError?) {
        XCTAssertNotNil(error)
        XCTAssertEqual(error?.code, 400)
    }
    
    func getSubdomainDetailsEnded(with subdomain: Subdomain?, error: FullHuntError?) {
        XCTAssertNotNil(error)
        XCTAssertEqual(error?.code, 400)
    }
}

fileprivate class ServiceManagerDomainSuccessMock: ServiceManagerProtocol {
    func makeNetworkRequest<T>(
        router: Router,
        completion: @escaping (Result<T, FullHuntError>) -> Void
    ) where T: Decodable {
        let domain = Domain(domain: "test.com", message: "", hosts: [], status: 200, metadata: nil)
        completion(.success(domain as! T))
    }
}

fileprivate class ServiceManagerSubdomainSuccessMock: ServiceManagerProtocol {
    func makeNetworkRequest<T>(
        router: Router,
        completion: @escaping (Result<T, FullHuntError>) -> Void
    ) where T: Decodable {
        let domain = Subdomain(domain: "test.test.com", message: "", subdomains: [], status: 200, metadata: nil)
        completion(.success(domain as! T))
    }
}
