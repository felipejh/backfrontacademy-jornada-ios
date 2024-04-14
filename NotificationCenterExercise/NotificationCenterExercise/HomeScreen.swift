//
//  HomeScreen.swift
//  NotificationCenterExercise
//
//  Created by Felipe Hoffmann on 14/04/24.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func tappedChooseButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenProtocol?
    
    public func delegate(delegate: HomeScreenProtocol) {
        self.delegate = delegate
    }

    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.image = UIImage(named: "logo_apple")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .white
        label.text = "Teste"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var chooseButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Escolher", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(tappedChooseButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedChooseButton(_ sender: UIButton) {
        delegate?.tappedChooseButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        
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
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -80),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            
            descriptionLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            chooseButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -60),
            chooseButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            chooseButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            chooseButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
}
