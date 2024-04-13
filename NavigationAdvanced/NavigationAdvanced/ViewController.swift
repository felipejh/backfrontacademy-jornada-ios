//
//  ViewController.swift
//  NavigationAdvanced
//
//  Created by Felipe Hoffmann on 29/03/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
    }
    
    @IBAction func tappedGoScreen02Button(_ sender: UIButton) {
        //MARK: Metodo simples de navegação
//        let vc: Screen02VC? = UIStoryboard(name: "Screen02VC", bundle: nil).instantiateViewController(withIdentifier: "Screen02VC") as? Screen02VC
//        
//        // Open as Modal
////        vc?.modalPresentationStyle = .fullScreen
////        self.present(vc ?? UIViewController(), animated: true)
//        
//        // Open as NavigationController  - it should create navigationController from Main.stotyboard
//        self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        
        //MARK: Transitando dados entre telas
        let vc: Screen02VC? = UIStoryboard(name: "Screen02VC", bundle: nil).instantiateViewController(identifier: "Screen02VC") {
            coder in return Screen02VC(coder: coder, name: self.nameTextField.text ?? "")
        }

        self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
}

