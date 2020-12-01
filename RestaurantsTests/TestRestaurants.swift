//
//  RestaurantsTests.swift
//  RestaurantsTests
//
//  Created by dhomes on 11/30/20.
//

import XCTest
@testable import Restaurants

class TestRestaurants: XCTestCase {

    func testSingleRestaurantDecoding() throws {
        guard let url = Bundle(for: type(of: self)).url(forResource: "Restaurant", withExtension: "json") else {
            XCTFail("Restaurant.json not found")
            return
        }
        
        guard let data = try? Data(contentsOf: url) else {
            XCTFail("Restaurant.json not found")
            return
        }
        
        do {
            let restaurant = try JSONDecoder().decode(AppRestaurant.self, from: data)
            XCTAssert(restaurant.id == 1)
            XCTAssert(restaurant.description != "")
        } catch {
            XCTFail("Failed decoding Restaurant")
        }
        
    }
    
    func testArrayRestaurantDecoding() throws {
        guard let url = Bundle(for: type(of: self)).url(forResource: "Restaurants", withExtension: "json") else {
            XCTFail("Restaurants.json not found")
            return
        }
        
        guard let data = try? Data(contentsOf: url) else {
            XCTFail("Restaurants.json not found")
            return
        }
        
        do {
            let restaurants = try JSONDecoder().decode([AppRestaurant].self, from: data)
            XCTAssert(restaurants.count == 5)
        } catch {
            XCTFail("Failed decoding Restaurants")
        }
        
    }
    
}
