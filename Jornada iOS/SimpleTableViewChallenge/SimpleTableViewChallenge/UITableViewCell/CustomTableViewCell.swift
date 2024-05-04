//
//  CustomTableViewCell.swift
//  SimpleTableViewChallenge
//
//  Created by Felipe Hoffmann on 01/04/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carLabel: UILabel!
    
    static let identifier: String = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func setupCell(_ data: Car) {
        carImageView.image = data.brandImage
        carLabel.text = data.brand
    }

    
}
