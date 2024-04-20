//
//  SingUpVC.swift
//  FirstAppMVVM
//
//  Created by Felipe Hoffmann on 20/04/24.
//

import UIKit

class SignUpVC: UIViewController {

    private var screen: SignUpScreen?
    private var viewModel = SignUpViewModel()
    
    override func loadView() {
        screen = SignUpScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTextFieldDelegate(delegate: self)
        viewModel.delegate(delegate: self)
    }
}

extension SignUpVC: SignUpScreenProtocol {
    func tappedSignUpButton() {
        viewModel.signUp(email: screen?.emailTextField.text ?? "", password: screen?.passwordTextField.text ?? "")
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension SignUpVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let email: String = screen?.emailTextField.text ?? ""
        let password: String = screen?.passwordTextField.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            screen?.signUpButton.backgroundColor = .darkGray.withAlphaComponent(0.4)
            screen?.signUpButton.isEnabled = false
        } else {
            screen?.signUpButton.backgroundColor = .blue
            screen?.signUpButton.setTitleColor(.white, for: .normal)
            screen?.signUpButton.isEnabled = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

extension SignUpVC: SignUpViewModelProtocol {
    func signUpSuccess() {
        navigationController?.popViewController(animated: true)
    }
    
    func signUpError(error: String) {
        Alert(controller: self).showAlertInformative(title: "Error", message: "Error: \(error).")
    }
    
    
}
