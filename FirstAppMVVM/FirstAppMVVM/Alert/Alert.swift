//
//  Alert.swift
//  FirstAppMVVM
//
//  Created by Felipe Hoffmann on 20/04/24.
//

import UIKit

class Alert {
    
    private let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    public func showAlertInformative(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(ok)
        controller.present(alertController, animated: true)
    }
}
