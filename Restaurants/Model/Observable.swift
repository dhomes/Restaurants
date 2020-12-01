//
//  Observable.swift
//  Restaurants
//
//  Created by dhomes on 11/30/20.
//

import Foundation

class Observable<T> {
    var value : T {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let s = self else { return }
                s.valueChanged?(s.value)
            }
        }
    }
    
    var valueChanged : ((T) -> ())? = nil
    
    init(_ value : T) {
        self.value = value
    }
}
