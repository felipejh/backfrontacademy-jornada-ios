//
//  LoginVC.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 12/04/24.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    var auth: Auth?
    var alert: AlertController?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
        alert = AlertController(controller: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        auth = Auth.auth()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldsDelegate(delegate: self)
        isEnableLoginButton(false)
    }
    
    private func validateTextField() {
        if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) &&
            (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
            isEnableLoginButton(true)
        } else {
            isEnableLoginButton(false)
        }
    }
    
    private func isEnableLoginButton(_ isEnabled: Bool) {
        if isEnabled {
            loginScreen?.loginButton.setTitleColor(.white, for: .normal)
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.subImageView.alpha = 1
        } else {
            loginScreen?.loginButton.setTitleColor(.lightGray, for: .normal)
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.subLoginImageView.alpha = 0.4
        }
    }
    
}

extension LoginVC: LoginScreenProtocol {
    func tappedLoginButton() {
        auth?.signIn(withEmail: loginScreen?.emailTextField.text ?? "", password: loginScreen?.passwordTextField.text ?? "", completion: { user, error in
            if error != nil {
                self.alert?.getAlert(title: "Falha no login", message: error?.localizedDescription ?? "", completion: {
                    print("pressed!")
                })
            } else {
                print("Sucesso no login")
            }
        })
        
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            switch textField {
            case self.loginScreen?.emailTextField:
                if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) {
                    loginScreen?.emailTextField.layer.borderWidth = 1.0
                    loginScreen?.emailTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    loginScreen?.emailTextField.layer.borderWidth = 1.5
                    loginScreen?.emailTextField.layer.borderColor = UIColor.red.cgColor
                }
            case self.loginScreen?.passwordTextField:
                if (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
                    loginScreen?.passwordTextField.layer.borderWidth = 0
                    loginScreen?.passwordTextField.layer.borderWidth = 1.0
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    loginScreen?.passwordTextField.layer.borderWidth = 1.5
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.red.cgColor
                }
            default:
                break
            }
        }
        validateTextField()
    }
}
