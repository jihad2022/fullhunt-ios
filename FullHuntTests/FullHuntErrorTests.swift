//
//  FullHuntErrorTests.swift
//  FullHuntTests
//
//  Created by Jihad Mahmoud on 16/12/2021.
//

import XCTest
@testable import FullHunt

class FullHuntErrorTests: XCTestCase {
    
    func testBadRequestError() {
        let error = FullHuntError.badRequest
        
        XCTAssertEqual(error.code, 400)
        XCTAssertEqual(error.description, "Your request is invalid.")
    }
    
    func testUnauthorizedError() {
        let error = FullHuntError.unauthorized
        
        XCTAssertEqual(error.code, 401)
        XCTAssertEqual(error.description, "Your API key is wrong.")
    }
    
    func testForbiddenError() {
        let error = FullHuntError.forbidden
        
        XCTAssertEqual(error.code, 403)
        XCTAssertEqual(error.description, "The requested resource is forbidden.")
    }
    
    func testNotFoundError() {
        let error = FullHuntError.notFount
        
        XCTAssertEqual(error.code, 404)
        XCTAssertEqual(error.description, "The requested resource could not be found.")
    }
    
    func testTooManyRequestsError() {
        let error = FullHuntError.tooManyRequests
        
        XCTAssertEqual(error.code, 429)
        XCTAssertEqual(error.description, "You are sending too many requests.")
    }
    
    func testBadResponseError() {
        let error = FullHuntError.badResponse
        
        XCTAssertEqual(error.code, 500)
        XCTAssertEqual(error.description, "The data is not in a correct format.")
    }
}
