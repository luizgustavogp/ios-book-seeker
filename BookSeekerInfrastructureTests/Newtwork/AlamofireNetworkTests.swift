//
//  AlamofireNetworkTests.swift
//  BookSeekerTests
//
//  Created by Luiz Guimarães on 18/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//


import XCTest
@testable import BookSeekerInfrastructure

class AlamofireNetworkTests: XCTestCase {
    
    func testFetchGetRequest() {
        
        //Arrange
        let alamofireNetworkService : AlamofireNetworkService = AlamofireNetworkService()
        let url : String = "https://itunes.apple.com/search";
        let term : String = "IOS"
        let limit : Int = 16
        let parameters: [String: Any] = ["term": term, "entity": "ebook", "limit" : limit]
        var responseResult : Any?
        var errorResult : String?
        let expectation = XCTestExpectation(description: "Fetching data from ITunes API")
        
        
        //Act
        alamofireNetworkService.get(url: url, parameters: parameters){ response, error in
            errorResult = error
            responseResult = response
            
            expectation.fulfill()
        }
        
        //Assert
        wait(for: [expectation], timeout: 10.0)
        XCTAssertNil(errorResult)
        XCTAssertNotNil(responseResult)
    }
}
