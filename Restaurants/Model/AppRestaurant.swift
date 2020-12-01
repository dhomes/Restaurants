//
//  AppRestaurant.swift
//  Restaurants
//
//  Created by dhomes on 11/30/20.
//

import Foundation

struct AppRestaurant : Restaurant {
    private(set) var id: Int
    private(set) var name: String
    private(set) var restaurantDescription: String
    private(set) var category: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case restaurantDescription = "description"
        case category
    }
}
