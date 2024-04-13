//
//  PeopleTableViewCell.swift
//  TabarChallengeWithCamera
//
//  Created by Felipe Hoffmann on 07/04/24.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    static let identifier = "PeopleTableViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!    
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    func setupCell(profile: Profile) {
        nameLabel.text = profile.name
        profileImageView.image = profile.picture
    }
}
