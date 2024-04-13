//
//  ViewController.swift
//  UIImageView
//
//  Created by Felipe Hoffmann on 29/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImageView.image = UIImage(named: "imageTest")
//        logoImageView.image = UIImage(systemName: "brain.head.profile")
        logoImageView.tintColor = .red
        logoImageView.contentMode = .scaleAspectFit
    }


}

