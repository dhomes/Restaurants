//
//  Restaurant.swift
//  Restaurants
//
//  Created by dhomes on 11/30/20.
//

import Foundation

protocol Restaurant : Codable, CustomStringConvertible {
    var id : Int { get }
    var name : String { get }
    var restaurantDescription : String { get }
    var category : String { get }
}

extension Restaurant {
    var description: String {
        """
        id: \(id)
        name: \(name)
        description: \(restaurantDescription)
        category: \(category)
        """
    }
}
