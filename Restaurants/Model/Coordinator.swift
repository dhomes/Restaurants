//
//  Coordinator.swift
//  Restaurants
//
//  Created by dhomes on 11/30/20.
//

import Foundation

class Coordinator : NSObject {
    
    private var childCoordinators = [Coordinator]()
    
    func start() {}
    
    var didFinish : ((Coordinator?) -> ())? = nil
    
    func pushCoordinator(_ coordinator : Coordinator) {
        coordinator.start()
        coordinator.didFinish = { [weak self] outCoodinator in
            guard let c = outCoodinator else { return }
            self?.popCoordinator(c)
        }
    }
    
    func popCoordinator(_ coordinator : Coordinator) {
        if let index = childCoordinators.firstIndex(of: coordinator) {
            childCoordinators.remove(at: index)
        }
    }
}
