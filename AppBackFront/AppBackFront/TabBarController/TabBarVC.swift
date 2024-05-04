//
//  TabBarVC.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 26/04/24.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTab()
    }

    private func setupTab() {
        let home = UINavigationController(rootViewController: HomeVC())
        let wallet = UINavigationController(rootViewController: WalletVC())
        
        setViewControllers([home, wallet], animated: false)
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
//        tabBar.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        
        let tabbarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabbarAppearance.configureWithDefaultBackground()
        tabbarAppearance.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        tabBar.standardAppearance = tabbarAppearance
        tabBar.scrollEdgeAppearance = tabbarAppearance
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "trash")
        items[1].image = UIImage(systemName: "wallet.pass")
    }
}
