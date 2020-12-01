//
//  TestViewModel.swift
//  RestaurantsTests
//
//  Created by dhomes on 11/30/20.
//

import XCTest
@testable import Restaurants

class TestViewModel: XCTestCase {

    func testViewModelAfterSuccess() throws {
        let mockApi = MockApi(expectedResult: .success)
        let model = AppRestaurantsViewModel(mockApi)
        
        let expectation = XCTestExpectation(description: "model expectation")
        expectation.expectedFulfillmentCount = 1
        model.error.valueChanged = { error in
            XCTFail("Should not fail \(error?.localizedDescription ?? "n/a")")
            expectation.fulfill()
        }
        model.restaurants.valueChanged = { restaurants in
            XCTAssert(restaurants.count == 5)
            expectation.fulfill()
        }
        model.fetch()
        wait(for: [expectation], timeout: 5) // Mock api is sync, but we may want to replace by a async mock down the road
        XCTAssert(model.error.value == nil)
    }
    
    func testViewModelAfterFailure() throws {
        let mockApi = MockApi(expectedResult: .failure)
        let model = AppRestaurantsViewModel(mockApi)
        
        let expectation = XCTestExpectation(description: "model expectation")
        expectation.expectedFulfillmentCount = 1
        model.error.valueChanged = { error in
            XCTAssert(error != nil)
            print(error?.localizedDescription ?? "n/a")
            expectation.fulfill()
        }
        model.restaurants.valueChanged = { restaurants in
            XCTAssert(restaurants.count == 5)
            expectation.fulfill()
        }
        model.fetch()
        wait(for: [expectation], timeout: 5) // Mock api is sync, but we may want to replace by a async mock down the road
        XCTAssert(model.error.value != nil)
        XCTAssert(model.count == 0 )
    }

}
