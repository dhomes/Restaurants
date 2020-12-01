//
//  RestaurantsController.swift
//  Restaurants
//
//  Created by dhomes on 11/30/20.
//

import UIKit

class RestaurantsController: UITableViewController, StoryboardInstantiable {

    static var storyboard: Storyboard = .Restaurants

    var model : RestaurantsViewModel!
    
    lazy var refresh : UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addAction(UIAction(handler: { [weak self] _ in
            self?.refresh.endRefreshing()
            self?.model.fetch()
        }), for: .valueChanged)
        refresh.tintColor = .white
        return refresh
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupModel()
        model.fetch()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: RestaurantCell.identifier, bundle: nil),
                       forCellReuseIdentifier: RestaurantCell.identifier)
        tableView.refreshControl = refresh
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    private func setupModel() {
        model.restaurants.valueChanged = { [weak self] _ in
            self?.tableView.reloadSections([0], with: .automatic)
        }
        model.error.valueChanged = { [weak self] error in
            self?.reportError(error)
        }
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension RestaurantsController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          model.count
      }
      
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          guard let restaurant = model.restaurantAt(indexPath) else {
              return UITableViewCell()
          }
          let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantCell.identifier) as! RestaurantCell
          cell.restaurant = restaurant
          return cell
      }
      
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)
      }
}
