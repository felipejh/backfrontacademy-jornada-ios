//
//  StoryCollectionViewCellScreen.swift
//  FirstAppMVVM
//
//  Created by Felipe Hoffmann on 16/04/24.
//

import UIKit

class StoryCollectionViewCellScreen: UIView {

    lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 35
        
        return image
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setBackgroundImage(UIImage(systemName: "plus.circle.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.tintColor = .blue
        button.backgroundColor = .white
        button.layer.cornerRadius = 12.5
        
        return button
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(profileImageView)
        addSubview(addButton)
        addSubview(userNameLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            profileImageView.widthAnchor.constraint(equalToConstant: 10),
            profileImageView.heightAnchor.constraint(equalToConstant: 10),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            addButton.widthAnchor.constraint(equalToConstant: 25),
            addButton.heightAnchor.constraint(equalToConstant: 25),
            addButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            addButton.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
    
}
