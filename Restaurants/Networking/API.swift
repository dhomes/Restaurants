//
//  API.swift
//  Restaurants
//
//  Created by dhomes on 11/30/20.
//

import Foundation

protocol API {
    func getRestaurants(_ completion : ((Result<[Restaurant],APIError>) -> ())?)
}
