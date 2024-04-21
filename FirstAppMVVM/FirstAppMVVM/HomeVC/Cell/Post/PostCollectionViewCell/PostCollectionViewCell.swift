//
//  PostCollectionViewCell.swift
//  FirstAppMVVM
//
//  Created by Felipe Hoffmann on 18/04/24.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "PostCollectionViewCell"
    
    private var screen = PostCollectionViewCellScreen()
    
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
    
    public func setupCell(data: Posts) {
        screen.postImageView.image = UIImage(named: data.profileImage ?? "")
        screen.userNameLabel.text = data.userName
        screen.postImageView.image = UIImage(named: data.postImage ?? "")
    }
}
