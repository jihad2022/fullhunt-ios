//
//  NetworkManagerTests.swift
//  FullHuntTests
//
//  Created by Jihad Mahmoud on 16/12/2021.
//

import XCTest
@testable import FullHunt

class ServiceManagerTests: XCTestCase {
    
    func testSuccessResponse() {
        let mockedService = ServiceManagerSuccessMock()
        
        mockedService.makeNetworkRequest(router: .getHostDetails(token: "", version: "", host: "")) { (result: Result<SuccessResponse, FullHuntError>) in
            switch result {
            case .success(let response):
                XCTAssertTrue(response.success)
            case .failure:
                return
            }
        }
    }
    
    func testFailedResponse() {
        let mockService = ServiceManagerFailureMock()
        
        mockService.makeNetworkRequest(router: .getHostDetails(token: "", version: "", host: "")) { (result: Result<SuccessResponse, FullHuntError>) in
            switch result {
            case .success:
                return
            case .failure(let error):
                XCTAssertEqual(error.code, 400)
            }
        }
    }
}

fileprivate class ServiceManagerSuccessMock: ServiceManagerProtocol {
    func makeNetworkRequest<T>(
        router: Router,
        completion: @escaping (Result<T, FullHuntError>) -> Void
    ) where T: Decodable {
        completion(.success(SuccessResponse(success: true) as! T))
    }
}

fileprivate class ServiceManagerFailureMock: ServiceManagerProtocol {
    func makeNetworkRequest<T>(
        router: Router,
        completion: @escaping (Result<T, FullHuntError>) -> Void
    ) where T: Decodable {
        completion(.failure(.badRequest))
    }
    
    
}

fileprivate struct SuccessResponse: Decodable {
    let success: Bool
}
