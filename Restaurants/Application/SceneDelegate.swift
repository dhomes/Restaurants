//
//  SceneDelegate.swift
//  Restaurants
//
//  Created by dhomes on 11/30/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var rootCoordinator : Coordinator!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let coodinator = RestaurantsCoodinator()
        coodinator.start()
        rootCoordinator = coodinator
        
        window?.rootViewController = coodinator.viewController
        window?.makeKeyAndVisible()
        
    }
}

