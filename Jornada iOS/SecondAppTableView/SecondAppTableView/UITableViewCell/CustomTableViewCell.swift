//
//  CustomTableViewCell.swift
//  SecondAppTableView
//
//  Created by Felipe Hoffmann on 31/03/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier: String = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(title: String) {
        titleLabel.text = title
    }
    
}
