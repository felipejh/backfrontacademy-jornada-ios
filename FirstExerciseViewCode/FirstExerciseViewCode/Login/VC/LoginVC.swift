//
//  LoginVC.swift
//  FirstExerciseViewCode
//
//  Created by Felipe Hoffmann on 11/04/24.
//

import UIKit

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?

    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldsDelegate(delegate: self)
    }


}

extension LoginVC: LoginScreenProtocol {
    func tappedSignInButton() {
        let homeVC = HomeVC()
        
        navigationController?.pushViewController(homeVC, animated: true)
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let email: String = loginScreen?.emailTextField.text ?? ""
        let password: String = loginScreen?.passwordTextField.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            loginScreen?.signInButton.isEnabled = false
            loginScreen?.signInButton.backgroundColor = .darkGray.withAlphaComponent(0.4)
        } else {
            loginScreen?.signInButton.isEnabled = true
            loginScreen?.signInButton.backgroundColor = .darkGray
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
