//
//  FullHuntNetworkTests.swift
//  FullHuntTests
//
//  Created by Jihad Mahmoud on 15/12/2021.
//

import XCTest
@testable import FullHunt

class FullHuntNetworkTests: XCTestCase {

    func testHTTPGETMethodRawValue() {
        let method = HTTPMethod.get
        
        XCTAssertEqual(method.rawValue, "GET")
    }
    
    func testHTTPJSONEncodingRawValue() {
        let encoding = HTTPEncoding.json
        
        XCTAssertEqual(encoding.rawValue, "application/json")
    }
    
    func testHTTPAPITokenHeaderKeyRawValue() {
        let apiTokenHeaderKey = HeaderKey.apiKey
        
        XCTAssertEqual(apiTokenHeaderKey.rawValue, "X-API-KEY")
    }
    
    func testRouterGetDomainDetails() {
        let getDomainDetails = Router.getDomainDetails(
            token: "testToken",
            version: "testVersion",
            domain: "test.com"
        )
        
        XCTAssertEqual(getDomainDetails.request?.httpMethod, HTTPMethod.get.rawValue)
        XCTAssertEqual(
            getDomainDetails.session.configuration.httpAdditionalHeaders?[
                HeaderKey.contentType.rawValue
            ] as? String,
            HTTPEncoding.json.rawValue
        )
        XCTAssertEqual(
            getDomainDetails.session.configuration.httpAdditionalHeaders?[
                HeaderKey.apiKey.rawValue
            ] as? String,
            "testToken"
        )
        XCTAssertEqual(
            getDomainDetails.request?.url?.absoluteString,
            "https://fullhunt.io/api/testVersion/domain/test.com/details"
        )
    }
    
    func testRouterGetSubdomains() {
        let getSubdomains = Router.getSubdomains(
            token: "testToken",
            version: "testVersion",
            domain: "test.com"
        )
        
        XCTAssertEqual(getSubdomains.request?.httpMethod, HTTPMethod.get.rawValue)
        XCTAssertEqual(
            getSubdomains.session.configuration.httpAdditionalHeaders?[
                HeaderKey.contentType.rawValue
            ] as? String,
            HTTPEncoding.json.rawValue
        )
        XCTAssertEqual(
            getSubdomains.session.configuration.httpAdditionalHeaders?[
                HeaderKey.apiKey.rawValue
            ] as? String,
            "testToken"
        )
        XCTAssertEqual(
            getSubdomains.request?.url?.absoluteString,
            "https://fullhunt.io/api/testVersion/domain/test.com/subdomains"
        )
    }
    
    func testRouterGetHostDetails() {
        let getHostDetails = Router.getHostDetails(
            token: "testToken",
            version: "testVersion",
            host: "test.test.com"
        )
        
        XCTAssertEqual(getHostDetails.request?.httpMethod, HTTPMethod.get.rawValue)
        XCTAssertEqual(
            getHostDetails.session.configuration.httpAdditionalHeaders?[
                HeaderKey.contentType.rawValue
            ] as? String,
            HTTPEncoding.json.rawValue
        )
        XCTAssertEqual(
            getHostDetails.session.configuration.httpAdditionalHeaders?[
                HeaderKey.apiKey.rawValue
            ] as? String,
            "testToken"
        )
        XCTAssertEqual(
            getHostDetails.request?.url?.absoluteString,
            "https://fullhunt.io/api/testVersion/host/test.test.com"
        )
    }
}
