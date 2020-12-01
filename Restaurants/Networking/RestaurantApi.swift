//
//  RestaurantsAPi.swift
//  Restaurants
//
//  Created by dhomes on 11/30/20.
//

import Foundation

struct RestaurantApi : API {
    
    /// Gets restaurant list using URSession
    ///
    /// - Much prefer Just for swift over URLSession -> https://github.com/dduan/Just
    ///
    /// - Parameter completion: optional completion block returning [Restaurant] on success
    func getRestaurants(_ completion : ((Result<[Restaurant],APIError>) -> ())?) {
        
        guard let url = URL(string: "http://www.json-generator.com/api/json/get/bQwCjWxBDS") else {
            completion?(.failure(.other("Invalid url")))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        request.timeoutInterval = 5
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion?(.failure(.error(error!)))
                return
            }
            guard let data = data else {
                completion?(.failure(.other("No data from service")))
                return
            }
            do {
                let restaurants = try JSONDecoder().decode([AppRestaurant].self, from: data)
                completion?(.success(restaurants))
            } catch {
                completion?(.failure(.error(error)))
            }
        }.resume()
        
    }
}
