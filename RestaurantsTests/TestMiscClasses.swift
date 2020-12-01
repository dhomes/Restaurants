//
//  TestModelClasses.swift
//  RestaurantsTests
//
//  Created by dhomes on 11/30/20.
//

import XCTest
@testable import Restaurants

class TestMiscClasses: XCTestCase {

    func testRestaurantCoordinator() {
        let coordinator = RestaurantsCoodinator()
        coordinator.start()
        XCTAssert(type(of: coordinator.viewController) == UINavigationController.self)
        guard let lastController = (coordinator.viewController as! UINavigationController).viewControllers.last else {
            
            XCTFail("empty navigation controller")
            return
        }
        XCTAssert(type(of: lastController) == RestaurantsController.self)
        let rc = lastController as! RestaurantsController
        XCTAssert(rc.model != nil)
    }
    
    func testStoryboardInstantiable() {
        let instantiable : StoryboardInstantiable = RestaurantsController.instantiate()
        XCTAssert(type(of: instantiable) == RestaurantsController.self)
    }

}
