//
//  UltimaTelaViewController.swift
//  Navigation
//
//  Created by Felipe Hoffmann on 29/03/24.
//

import UIKit

class UltimaTelaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func tappetGoFirstScreen(_ sender: UIBarButtonItem) {
        // Back to previous screen
//        self.navigationController?.popViewController(animated: true)
        
        // Back to root
        self.navigationController?.popToRootViewController(animated: true)
    }
}
