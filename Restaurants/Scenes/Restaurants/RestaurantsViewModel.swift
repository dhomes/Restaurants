//
//  RestaurantsViewModel.swift
//  Restaurants
//
//  Created by dhomes on 11/30/20.
//

import Foundation

protocol RestaurantsViewModel {
    var restaurants : Observable<[Restaurant]> { get }
    var error : Observable<APIError?> { get }
    var count : Int { get }
    func restaurantAt(_ index : IndexPath) -> Restaurant?
    func fetch()
}
