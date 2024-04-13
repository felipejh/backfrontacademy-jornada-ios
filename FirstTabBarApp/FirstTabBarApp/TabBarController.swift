//
//  TabBarController.swift
//  FirstTabBarApp
//
//  Created by Felipe Hoffmann on 04/04/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configItems()
        configTabBar()
    }

    func configItems() {
        guard let items = tabBar.items else { return }
        items[0].title = "Teste Tela 01"
        items[1].title = "Teste Tela 02"
        items[2].title = "Teste Tela 03"
    }
    
    func configTabBar() {
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.backgroundColor = .white
    }
}
