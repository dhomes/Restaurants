//
//  AppRestaurantsCoodinator.swift
//  Restaurants
//
//  Created by dhomes on 11/30/20.
//

import Foundation

class AppRestaurantsViewModel : RestaurantsViewModel {
    
    var restaurants: Observable<[Restaurant]> = Observable<[Restaurant]>([Restaurant]())
    var error: Observable<APIError?> = Observable<APIError?>(nil)
    var count: Int { restaurants.value.count }
    var api : API
    
    init(_ api : API) {
        self.api = api
    }
    
    func restaurantAt(_ index: IndexPath) -> Restaurant? {
        guard index.row < restaurants.value.count else {
            return nil
        }
        return restaurants.value[index.row]
    }
    
    func fetch() {
        api.getRestaurants { [weak self] result in
            switch result {
            case .failure(let error):
                self?.error.value = error
            case .success(let restaurants):
                self?.restaurants.value = restaurants
            }
        }
    }
}
