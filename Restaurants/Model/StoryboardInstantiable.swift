//
//  Storyboard.swift
//  Restaurants
//
//  Created by dhomes on 11/30/20.
//

import UIKit

enum Storyboard : String {
    case Restaurants
}

protocol StoryboardInstantiable {
    static var storyboard : Storyboard { get }
    static func instantiate() -> Self
}

extension StoryboardInstantiable {
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: Self.storyboard.rawValue, bundle: nil)
        guard let controller = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Could not instantiate initial controller of type: \(String(describing: type(of: Self.self))) in storyboard: \(Self.storyboard.rawValue)")
        }
        return controller
    }
}
