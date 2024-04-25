//
//  LoginScreen.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 12/04/24.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol) {
        self.delegate = delegate
    }

    lazy var subImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.image = UIImage(named: "BGLogin")
        
        return image
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.image = UIImage(named: "BFLogin")
        
        return image
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .white
        label.text = "BF NFT"
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "O marketplace de NFTs da Backfront Academy"
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.textColor = .white
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.cornerRadius = 12
        tf.clipsToBounds = true
        tf.attributedPlaceholder = NSAttributedString(string: "E-mail", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = true
        tf.textColor = .white
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.cornerRadius = 12
        tf.clipsToBounds = true
        tf.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        
        return tf
    }()
    
    lazy var recoverPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Recuperar senha", for: .normal)
        button.setTitleColor(UIColor(red: 231/255, green: 48/255, blue: 214/255, alpha: 1.0), for: .normal)
        
        button.addTarget(self, action: #selector(tappedRecoverPasswordButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var subLoginImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.image = UIImage(named: "gradient3")
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        
        return view
    }()
    
    lazy var signInMetamaskView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1.0).cgColor
        
        return view
    }()
    
    lazy var signInMetamaskImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.image = UIImage(named: "logo")
        
        return image
    }()
    
    lazy var signInMetamaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Entrar com a Metamask"
        
        return label
    }()
    
    @objc func tappedRecoverPasswordButton(_ sender: UIButton) {
        
    }
    
    @objc func tappedLoginButton(_ sender: UIButton) {
        delegate?.tappedLoginButton()
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
        self.addSubview(subImageView)
        self.addSubview(logoAppImageView)
        self.addSubview(loginLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(recoverPasswordButton)
        self.addSubview(subLoginImageView)
        self.addSubview(loginButton)
        self.addSubview(lineView)
        self.addSubview(signInMetamaskView)
        signInMetamaskView.addSubview(signInMetamaskImageView)
        signInMetamaskView.addSubview(signInMetamaskLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            subImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subImageView.topAnchor.constraint(equalTo: topAnchor),
            subImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            subImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 55),
            logoAppImageView.heightAnchor.constraint(equalToConstant: 108),
            logoAppImageView.widthAnchor.constraint(equalToConstant: 108),
            logoAppImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 16),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            emailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 39),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 11),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            recoverPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 9),
            recoverPasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            recoverPasswordButton.heightAnchor.constraint(equalToConstant: 16),
            
            subLoginImageView.topAnchor.constraint(equalTo: recoverPasswordButton.bottomAnchor, constant: 36),
            subLoginImageView.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            subLoginImageView.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            subLoginImageView.heightAnchor.constraint(equalToConstant: 43),
            
            loginButton.topAnchor.constraint(equalTo: subLoginImageView.topAnchor),
            loginButton.leadingAnchor.constraint(equalTo: subLoginImageView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: subLoginImageView.trailingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: subLoginImageView.bottomAnchor),
            
            lineView.topAnchor.constraint(equalTo: subLoginImageView.bottomAnchor, constant: 48),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            signInMetamaskView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 48),
            signInMetamaskView.leadingAnchor.constraint(equalTo: subLoginImageView.leadingAnchor),
            signInMetamaskView.trailingAnchor.constraint(equalTo: subLoginImageView.trailingAnchor),
            signInMetamaskView.heightAnchor.constraint(equalToConstant: 41),
            
            signInMetamaskImageView.leadingAnchor.constraint(equalTo: signInMetamaskView.leadingAnchor, constant: 53),
            signInMetamaskImageView.centerYAnchor.constraint(equalTo: signInMetamaskView.centerYAnchor),
            signInMetamaskImageView.heightAnchor.constraint(equalToConstant: 20),
            signInMetamaskImageView.widthAnchor.constraint(equalToConstant: 20),
            
            signInMetamaskLabel.centerXAnchor.constraint(equalTo: signInMetamaskView.centerXAnchor),
            signInMetamaskLabel.centerYAnchor.constraint(equalTo: signInMetamaskView.centerYAnchor),
        ])
    }
    
    public func configTextFieldsDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
}
