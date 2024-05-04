//
//  ViewController.swift
//  UISlider
//
//  Created by Felipe Hoffmann on 29/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.minimumValue = 0
        slider.value = 0
        slider.maximumValue = 20
        
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .blue
        slider.thumbTintColor = .green
    }


    @IBAction func tappedSlider(_ sender: UISlider) {
        print(Int(sender.value))
    }
}

