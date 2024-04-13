//
//  TabBarController.swift
//  TabBarChallenge
//
//  Created by Felipe Hoffmann on 06/04/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()
        configTabBarItems()
    }

    func configTabBarItems() {
        guard let items = tabBar.items else { return }
        
        items[0].title = "Tela 01"
        items[0].image = UIImage(systemName: "person")
        
        items[1].title = "Tela 02"
        items[1].image = UIImage(systemName: "wrench")
    }
    
    func configTabBar() {
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.backgroundColor = .white
    }

}
