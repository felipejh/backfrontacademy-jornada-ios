//
//  SignUpScreen.swift
//  FirstAppMVVM
//
//  Created by Felipe Hoffmann on 20/04/24.
//

import UIKit

protocol SignUpScreenProtocol: AnyObject {
    func tappedSignUpButton()
    func tappedBackButton()
}

class SignUpScreen: UIView {
    
    private weak var delegate: SignUpScreenProtocol?

    public func delegate(delegate: SignUpScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Cadastre-se"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 40)
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        
        textField.textColor = .darkGray
        textField.backgroundColor = .white
        textField.placeholder = "E-mail"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false

        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.placeholder = "Password"
        
        textField.textColor = .darkGray
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        
        return textField
    }()

    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = .darkGray.withAlphaComponent(0.4)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.isEnabled = false
        button.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedSignUpButton(_ sender: UIButton) {
        delegate?.tappedSignUpButton()
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("< Voltar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = .clear
        button.setTitleColor(.darkGray, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedBackButton(_ sender: UIButton) {
        delegate?.tappedBackButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.addSubview(signUpLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(signUpButton)
        self.addSubview(backButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            signUpLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            signUpLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 45),
            emailTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            signUpButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            signUpButton.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor),
            
            backButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: signUpButton.leadingAnchor),
            backButton.trailingAnchor.constraint(equalTo: signUpButton.trailingAnchor),
            backButton.heightAnchor.constraint(equalTo: signUpButton.heightAnchor),
        ])
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
}
