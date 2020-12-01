//
//  APIError.swift
//  Restaurants
//
//  Created by dhomes on 11/30/20.
//

import Foundation

enum APIError : LocalizedError {
    case error(Error)
    case other(String)
    var errorDescription : String {
        switch self {
        case .error(let error):
            return error.localizedDescription
        case .other(let message):
            return message
        }
    }
}
