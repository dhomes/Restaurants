//
//  Appearance.swift
//  Restaurants
//
//  Created by dhomes on 11/30/20.
//

import UIKit

protocol Appearance {
    var navigationBarBackgroundColor : UIColor { get }
    var navigationBarTintColor : UIColor { get }
    var cellTitleColor : UIColor { get }
    var cellBodyTextColor : UIColor { get }
    var cellSubheaderColor : UIColor { get }
}

extension Appearance {
    
    private var defaultColor : UIColor { .clear }
    
    var navigationBarBackgroundColor : UIColor {
        UIColor(named: "navigationBackgroundColor") ?? defaultColor
    }
    
    var navigationBarTintColor : UIColor {
        UIColor(named: "navigationBarTintColor") ?? defaultColor
    }
    
    var cellTitleColor : UIColor {
        UIColor(named: "cellTitleColor") ?? defaultColor
    }
    
    var cellBodyTextColor : UIColor {
        UIColor(named: "cellBodyTextColor") ?? defaultColor
    }
    
    var cellSubheaderColor : UIColor {
        UIColor(named: "cellSubheaderColor") ?? defaultColor
    }
    
}
