//
//  WalletVC.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 03/05/24.
//

import UIKit

class WalletVC: UIViewController {
    
    private var screen: WalletScreen?
    private var viewModel = WalletViewModel()
    
    override func loadView() {
        screen = WalletScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetch(.request)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
}
