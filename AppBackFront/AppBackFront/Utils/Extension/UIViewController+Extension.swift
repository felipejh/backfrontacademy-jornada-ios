//
//  UIViewController+Extension.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 24/04/24.
//

import Foundation
import UIKit

extension UIViewController {
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
