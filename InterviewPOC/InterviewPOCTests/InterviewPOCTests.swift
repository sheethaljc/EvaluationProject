//
//  InterviewPOCTests.swift
//  InterviewPOCTests
//
//  Created by sheethal.chalissery on 28/10/24.
//

import XCTest
@testable import InterviewPOC

final class InterviewPOCTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    

    func testNewsListSuccess() async throws {
        let mockList = MockListVc()
        mockList.interactor = NewsListInteracter()
        try await mockList.interactor?.fetchNews()
        XCTAssertNotNil(mockList.interactor?.results, "View loaded scuccessfully")
    }
    
    func testNewsListInvalidUrl() async {
        let mockList = MockListVc()
        do {
            let _ = try await mockList.fetchNewsFailure("sss")
        } catch {
            print(error.localizedDescription)
            if let error = error as? NetworkErrors, error == .invalidUrl {
                XCTAssertTrue(true, "Url is invalid")
            } else {
                XCTAssertTrue(false, "Something wrong")

            }
        }
    }

}

class MockListVc {
    var networkDelegate: NetworkDelegate = NetworkManager()
    var interactor: NewsListInteracter?

    func fetchNewsFailure( _ url: String) async throws -> [NewsList.Results]? {
        let model = try await networkDelegate.fetchData(ApiUrl(rawValue: url), type: NewsList.Model.self)
        let results = model.results
        return Utility.sortByDates(results)
    }
}
