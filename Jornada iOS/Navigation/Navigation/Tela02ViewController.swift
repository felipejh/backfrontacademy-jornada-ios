//
//  Tela02ViewController.swift
//  Navigation
//
//  Created by Felipe Hoffmann on 29/03/24.
//

import UIKit

class Tela02ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func tappedGoToScreen02Button(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
