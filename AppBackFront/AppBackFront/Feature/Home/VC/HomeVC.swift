//
//  HomeVC.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 26/04/24.
//

import UIKit

class HomeVC: UIViewController {
    
    var screen: HomeScreen?

    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
}
