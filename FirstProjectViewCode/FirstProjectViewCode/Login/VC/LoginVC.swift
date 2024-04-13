//
//  ViewController.swift
//  FirstProjectViewCode
//
//  Created by Felipe Hoffmann on 08/04/24.
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
        loginScreen?.configTextFieldDelegate(delegate: self)
    }


}

extension LoginVC: LoginScreenProtocol {
    func tappedLoginButton() {
        print("Protocol")
        let vc: HomeVC = HomeVC()
        
//        Open as modal
//        present(vc, animated: true)
        
//        Open the second as a navigationBar
//        let nav = UINavigationController(rootViewController: vc)
//        present(vc, animated: true)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        let email: String = loginScreen?.emailTextField.text ?? ""
        let password: String = loginScreen?.passwordTextField.text ?? ""
               
        if email.isEmpty || password.isEmpty {
            print("Disabled button")
            loginScreen?.loginButton.backgroundColor = .darkGray.withAlphaComponent(0.4)
            loginScreen?.loginButton.isEnabled = false
        } else {
            print("Button enabled")
            loginScreen?.loginButton.setTitleColor(.white, for: .normal)
            loginScreen?.loginButton.backgroundColor = .darkGray
            loginScreen?.loginButton.isEnabled = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return false
    }
}
