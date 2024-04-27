//
//  HomeVC.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 26/04/24.
//

import UIKit

class HomeVC: UIViewController {
    
    var screen: HomeScreen?
    var viewModel = HomeViewModel()

    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate(delegate: self)
        viewModel.fetchRequest(.request)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
}

extension HomeVC: HomeViewModelDelegate {
    func success() {
        print(#function)
    }
    
    func error() {
        print(#function)
    }
    
    
}
