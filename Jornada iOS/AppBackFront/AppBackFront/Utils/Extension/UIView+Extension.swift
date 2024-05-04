//
//  UIView+Extension.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 02/05/24.
//

import Foundation
import UIKit

extension UIView {

    public func roundCorners(cornerRadius: Double, typeCorners: CACornerMask) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
        self.layer.maskedCorners = typeCorners
    }
}
