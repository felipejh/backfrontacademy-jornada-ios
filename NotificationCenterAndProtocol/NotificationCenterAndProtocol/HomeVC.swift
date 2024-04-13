//
//  ViewController.swift
//  NotificationCenterAndProtocol
//
//  Created by Felipe Hoffmann on 13/04/24.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

