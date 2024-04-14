//
//  ViewController.swift
//  NotificationCenterExercise
//
//  Created by Felipe Hoffmann on 14/04/24.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
        
        homeScreen?.delegate(delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(selectorMacbook(notification:)), name: Notification.Name("macbook"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(selectorImac(notification:)), name: Notification.Name("imac"), object: nil)
    }


    @objc func selectorMacbook(notification: Notification) {
        homeScreen?.descriptionLabel.text = "Macbook Pro"
        homeScreen?.logoImageView.image = UIImage(named: "macbook_pro")?.withRenderingMode(.alwaysOriginal)
        homeScreen?.backgroundColor = notification.object as? UIColor
    }
    
    @objc func selectorImac(notification: Notification) {
        homeScreen?.descriptionLabel.text = "iMac Pro"
        homeScreen?.logoImageView.image = UIImage(named: "imac_pro")?.withRenderingMode(.alwaysOriginal)
        homeScreen?.backgroundColor = UIColor.cyan
    }
}

extension HomeVC: HomeScreenProtocol {
    func tappedChooseButton() {
        let selecionVC = SelectionVC()
        selecionVC.modalPresentationStyle = .fullScreen
        present(selecionVC, animated: true)
    }
}
