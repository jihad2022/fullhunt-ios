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

}
