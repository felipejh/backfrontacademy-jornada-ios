//
//  TabBarController.swift
//  TabarChallengeWithCamera
//
//  Created by Felipe Hoffmann on 07/04/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configTabBarItems()
        configTabBar()
    }
    
    func configTabBarItems() {
        guard let items = tabBar.items else { return }
        
        items[0].title = "Profile"
        items[0].image = UIImage(systemName: "person")
        
        items[1].title = "Vehicles"
        items[1].image = UIImage(systemName: "car")
        
        items[2].title = "Settings"
        items[2].image = UIImage(systemName: "gearshape")
    }
    
    func configTabBar() {
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.backgroundColor = .white
    }

}
