//
//  TestConcreteAPI.swift
//  RestaurantsTests
//
//  Created by dhomes on 11/30/20.
//

import XCTest
@testable import Restaurants

class TestConcreteAPI: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = false

    }

    func testConcreteApi() throws {
         let api = RestaurantApi()
         let expectation = XCTestExpectation(description: "network")
         expectation.expectedFulfillmentCount = 1
         api.getRestaurants { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail(error.localizedDescription)
            case .success(let restaurants):
                XCTAssert(restaurants.count > 0)
            }
            expectation.fulfill()
         }
        
         wait(for: [expectation], timeout: 5)
    
         
    }

}
