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
        homeScreen?.delete(delegate: self)
        configObserver()
    }

    func configObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateMacbook(notification:)), name: NSNotification.Name("macbook"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateImac(notification:)), name: NSNotification.Name("imac"), object: nil)
    }
    
    @objc func updateMacbook(notification: NSNotification) {
        homeScreen?.logoImageView.image = UIImage(named: "macbook_pro")
        homeScreen?.descriptionLabel.text = "Macbook Pro"
        view.backgroundColor = .red
    }
    
    @objc func updateImac(notification: NSNotification) {
        homeScreen?.logoImageView.image = UIImage(named: "imac_pro")
        homeScreen?.descriptionLabel.text = "iMac Pro"
        view.backgroundColor = .cyan
    }
}

extension HomeVC: HomeScreenProtocol {
    func tappedChooseButton() {
        let vc = SelectionVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
}
