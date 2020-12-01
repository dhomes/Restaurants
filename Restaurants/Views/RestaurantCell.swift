//
//  RestaurantCell.swift
//  Restaurants
//
//  Created by dhomes on 11/30/20.
//

import UIKit

class RestaurantCell: UITableViewCell {

    static let identifier = "RestaurantCell"
    static var appearance : Appearance = DefaultAppearance()
    
    @IBOutlet weak var restaurantName : UILabel!
    @IBOutlet weak var restaurantDescription : UILabel!
    @IBOutlet weak var category : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        restaurantName.textColor = Self.appearance.cellTitleColor
        restaurantDescription.textColor = Self.appearance.cellBodyTextColor
        category.textColor = Self.appearance.cellSubheaderColor
    }
    var restaurant : Restaurant! {
        didSet {
            restaurantName.text = restaurant.name
            restaurantDescription.text = restaurant.restaurantDescription
            category.text = restaurant.category.capitalized
        }
    }
    
}
