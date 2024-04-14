//
//  HomeScreen.swift
//  NotificationCenterAndProtocol
//
//  Created by Felipe Hoffmann on 13/04/24.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func tappedChooseButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenProtocol?
    
    public func delete(delegate: HomeScreenProtocol) {
        self.delegate = delegate
    }

    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "logo_apple")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
        
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 26)
        
        return label
    }()
    
    lazy var chooseButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Clique aqui", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        
        button.addTarget(self, action: #selector(tappedChooseButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedChooseButton(_ sender: UIButton) {
        delegate?.tappedChooseButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.addSubview(logoImageView)
        self.addSubview(descriptionLabel)
        self.addSubview(chooseButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -80),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            
            descriptionLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 60),
            
            chooseButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -60),
            chooseButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            chooseButton.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            chooseButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
