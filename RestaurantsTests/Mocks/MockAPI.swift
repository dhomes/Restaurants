//
//  MockAPI.swift
//  RestaurantsTests
//
//  Created by dhomes on 11/30/20.
//

import Foundation

@testable import Restaurants

enum MockApiResult {
    case success, failure
}

class MockApi : API {
    
    var resultType : MockApiResult
    
    init(expectedResult : MockApiResult) {
        self.resultType = expectedResult
    }
    
    func getRestaurants(_ completion: ((Result<[Restaurant], APIError>) -> ())?) {
        switch resultType {
        case .failure:
            completion?(.failure(failedRequest()))
        case .success:
            completion?(.success(successfulRequest()))
        }
    }
    
    private func successfulRequest() -> [Restaurant] {
        let url = Bundle(for: type(of: self)).url(forResource: "Restaurants", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let restaurants = try! JSONDecoder().decode([AppRestaurant].self, from: data)
        return restaurants
    }
    
    private func failedRequest() -> APIError {
        return APIError.other("Could not complete request")
    }
    
}
