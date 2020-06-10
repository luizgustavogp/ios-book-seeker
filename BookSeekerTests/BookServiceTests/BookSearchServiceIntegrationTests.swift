//
//  BookSearchServiceIntegrationTests.swift
//  BookSeekerTests
//
//  Created by Luiz Guimarães on 19/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import XCTest

@testable import BookSeeker
@testable import BookSeekerDomain
@testable import BookSeekerInfrastructure

class BookSearchServiceIntegrationTests: XCTestCase {

    private var bookServiceApi: BookSearchService!

    override func setUp() {
        super.setUp()

        let network: AlamofireHttpGetService = AlamofireHttpGetService()

        self.bookServiceApi = BookSearchService(networkService: network)
    }

    override func tearDown() {

    }

    func test_seachBookByValidTerm() {
        //Arrange
        let term: String = "IOS"
        var bookResponseResult: BookResponse?
        var errorResult: String?
        let expectation = XCTestExpectation(description: "Fetching data by term from ITunes API")

        //Act
        self.bookServiceApi.findByTerm(term: term) { response, error in
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
        let bookId: Int = 666441761
        var bookResponseResult: BookResponse?
        var errorResult: String?
        let expectation = XCTestExpectation(description: "Fetching data by id from ITunes API")

        //Act
        self.bookServiceApi.findById(bookId: bookId) { response, error in
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
