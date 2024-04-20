//
//  LoginViewModel.swift
//  FirstAppMVVM
//
//  Created by Felipe Hoffmann on 20/04/24.
//

import UIKit
import Firebase

protocol LoginViewModelProtocol: AnyObject {
    func successLogin()
    func errorLogin(error: String)
}

class LoginViewModel {

    private weak var delegate: LoginViewModelProtocol?
    
    private var auth = Auth.auth()
    
    public func delegate(delegate: LoginViewModelProtocol) {
        self.delegate = delegate
    }
    
    public func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                self.delegate?.successLogin()
            } else {
                self.delegate?.errorLogin(error: (error?.localizedDescription ?? ""))
            }
        }
    }
    
    public func registerUser(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("SignOn success")
            } else {
                print("SignOn error. Error: \(error?.localizedDescription ?? "")")
            }
        }
    }
}
