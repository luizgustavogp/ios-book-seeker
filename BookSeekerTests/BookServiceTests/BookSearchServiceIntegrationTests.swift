//
//  BookSearchServiceIntegrationTests.swift
//  BookSeekerTests
//
//  Created by Luiz Guimarães on 19/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import XCTest
@testable import BookSeeker

class BookSearchServiceIntegrationTests: XCTestCase {
    
    private var bookServiceApi :BookSearchApiService!
    
    override func setUp() {
        super.setUp()
        
        let network : AlamofireNetworkService = AlamofireNetworkService()
        
        self.bookServiceApi = BookSearchApiService(networkService: network)
    }
    
    override func tearDown() {
        
    }
    
    func test_seachBookByValidTerm() {
        //Arrange
        let term : String = "IOS"
        var bookResponseResult : BookResponse?
        var errorResult : String?
        let expectation = XCTestExpectation(description: "Fetching data by term from ITunes API")
        
        //Act
        self.bookServiceApi.findByTerm(term: term){ response, error in
            errorResult = error
            bookResponseResult = response
            
            expectation.fulfill()
        }
        
        //Assert
        wait(for: [expectation], timeout: 10.0)
        XCTAssertNil(errorResult)
        XCTAssertNotNil(bookResponseResult)
    }
    
    func test_seachBookByValidId() {        
        //Arrange
        let id : Int = 666441761
        var bookResponseResult : BookResponse?
        var errorResult : String?
        let expectation = XCTestExpectation(description: "Fetching data by id from ITunes API")
        
        //Act
        self.bookServiceApi.findById(id: id){ response, error in
            errorResult = error
            bookResponseResult = response
            
            expectation.fulfill()
        }
        
        //Assert
        wait(for: [expectation], timeout: 10.0)
        XCTAssertNil(errorResult)
        XCTAssertNotNil(bookResponseResult)
    }
}
