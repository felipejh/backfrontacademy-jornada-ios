//
//  CustomCollectionViewCell.swift
//  CollectionViewChallenge
//
//  Created by Felipe Hoffmann on 02/04/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = "CustomCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.contentMode = .scaleAspectFill
    }

    func setupCell(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}
