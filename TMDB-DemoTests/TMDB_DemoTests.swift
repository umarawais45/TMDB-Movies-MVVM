//
//  TMDB_DemoTests.swift
//  TMDB-DemoTests
//
//  Created by Umar Awais on 26/08/2023.
//

import XCTest
@testable import TMDB_Demo

final class TMDB_DemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchMovies() throws {
        var result: [Movie]?
        let expectation = self.expectation(description: "Movies Fetched")

        let moviesService = MoviesService()
        moviesService.fetchMovies() { movies, error in
            result = movies
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertNotNil(result)
        if let result {
            XCTAssertGreaterThan(result.count, 0)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
