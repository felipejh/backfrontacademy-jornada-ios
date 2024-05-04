//
//  ProfileTableViewCellScreen.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 04/05/24.
//

import UIKit

protocol ProfileTableViewCellScreenProtocol: AnyObject {
    func tappedLogoutButton()
}

class ProfileTableViewCellScreen: UIView {
    
    private weak var delegate: ProfileTableViewCellScreenProtocol?
    
    public func delegate(delegate: ProfileTableViewCellScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(named: "user")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 65
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        
        return imageView
    }()
    
    lazy var editImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(systemName: "pencil")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .white
        
        return imageView
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("Sair do App", for: .normal)
        button.setTitleColor(UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1), for: .normal)
        button.layer.borderWidth = 1.7
        button.layer.borderColor = UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1).cgColor
        button.addTarget(self, action: #selector(tappedLogoutButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedLogoutButton(_ sender: UIButton) {
        delegate?.tappedLogoutButton()
    }
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "Felipe Hoffmann"
        label.textAlignment = .right
        
        return label
    }()
    
    lazy var profileAtLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "@userProfile"
        label.textAlignment = .right
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 25/255, green: 26/255, blue: 1/255, alpha: 1)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(userImageView)
        addSubview(editImageView)
        addSubview(logoutButton)
        addSubview(nameLabel)
        addSubview(profileAtLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userImageView.heightAnchor.constraint(equalToConstant: 130),
            userImageView.widthAnchor.constraint(equalToConstant: 130),
            
            editImageView.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor),
            editImageView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: -25),
            editImageView.heightAnchor.constraint(equalToConstant: 25),
            editImageView.widthAnchor.constraint(equalToConstant: 25),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            profileAtLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            profileAtLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            logoutButton.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 60),
            logoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            logoutButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
