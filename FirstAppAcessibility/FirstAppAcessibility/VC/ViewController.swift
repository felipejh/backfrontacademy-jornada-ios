//
//  ViewController.swift
//  FirstAppAcessibility
//
//  Created by Felipe Hoffmann on 22/04/24.
//

import UIKit

class ViewController: UIViewController {

    private var screen: ViewControllerScreen?
    
    override func loadView() {
        screen = ViewControllerScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

