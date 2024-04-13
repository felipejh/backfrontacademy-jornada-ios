//
//  ViewController.swift
//  UIStepper
//
//  Created by Felipe Hoffmann on 29/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.value = 0
        stepper.stepValue = 10
        
    }

    @IBAction func tappedStepper(_ sender: UIStepper) {
        print(sender.value)
        
        valueLabel.text = String(Int(sender.value))
    }
}

