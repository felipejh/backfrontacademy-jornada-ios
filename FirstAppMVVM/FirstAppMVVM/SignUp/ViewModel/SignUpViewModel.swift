//
//  SignUpViewModel.swift
//  FirstAppMVVM
//
//  Created by Felipe Hoffmann on 20/04/24.
//

import UIKit
import Firebase

protocol SignUpViewModelProtocol: AnyObject {
    func signUpSuccess()
    func signUpError(error: String)
}

class SignUpViewModel {

    private weak var delegate: SignUpViewModelProtocol?
        
    private var auth = Auth.auth()
    
    public func delegate(delegate: SignUpViewModelProtocol) {
        self.delegate = delegate
    }
    
    public func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                self.delegate?.signUpSuccess()
            } else {
                self.delegate?.signUpError(error: error?.localizedDescription ?? "")
            }
        }
    }
}
