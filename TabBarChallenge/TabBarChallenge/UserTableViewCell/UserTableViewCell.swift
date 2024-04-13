//
//  UserTableViewCell.swift
//  TabBarChallenge
//
//  Created by Felipe Hoffmann on 06/04/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var labelUser: UILabel!
    
    static let identifier = "UserTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func setupCell(userImage: UIImage, userName: String) {
        imageUser.image = userImage
        labelUser.text = userName
    }
}
