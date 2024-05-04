//
//  LoginScreen.swift
//  FirstExerciseViewCode
//
//  Created by Felipe Hoffmann on 11/04/24.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedSignInButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = "E-mail"
        textField.textColor = .darkGray
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = "Passoword"
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.textColor = .darkGray
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .darkGray.withAlphaComponent(0.4)
        button.isEnabled = true
        button.addTarget(self, action: #selector(tappedSignInButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedSignInButton(_sender: UIButton) {
        delegate?.tappedSignInButton()
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
    
    func addElements() {
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(signInButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            signInButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            signInButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
        ])
    }
    
    func configTextFieldsDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
}
