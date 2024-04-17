//
//  StoryCollectionViewCell.swift
//  FirstAppMVVM
//
//  Created by Felipe Hoffmann on 16/04/24.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "StoryCollectionViewCell"
    
    private var screen = StoryCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.pin(to: contentView)
    }
    
    public func setupCell(data: Stories, indexPath: IndexPath) {
        screen.profileImageView.image = UIImage(named: data.image)
        screen.userNameLabel.text = data.userName
        screen.addButton.isHidden = indexPath.row == 0 ? false : true
    }
}
