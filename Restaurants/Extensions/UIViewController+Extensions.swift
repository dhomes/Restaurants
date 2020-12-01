//
//  UIViewController+Extensions.swift
//  Restaurants
//
//  Created by dhomes on 11/30/20.
//

import UIKit

extension UIViewController {
    func reportError(_ error : Error?) {
        guard let e = error else { return }
        let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

