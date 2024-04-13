//
//  LoginVC.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 12/04/24.
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

        // Do any additional setup after loading the view.
    }

}
