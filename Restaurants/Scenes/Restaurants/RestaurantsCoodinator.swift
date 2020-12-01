//
//  MainCoordinator.swift
//  Restaurants
//
//  Created by dhomes on 11/30/20.
//

import UIKit

class RestaurantsCoodinator : Coordinator {
    
    var viewController : UIViewController {
        navigationController
    }
    
    private lazy var navigationController : UINavigationController = {
        let nc = UINavigationController()
        nc.navigationBar.prefersLargeTitles = true
        return nc
    }()
    
    override func start() {
        let controller = RestaurantsController.instantiate()
        let api = RestaurantApi()
        let model = AppRestaurantsViewModel(api)
        controller.model = model
        navigationController.pushViewController(controller, animated: false)
    }
}
