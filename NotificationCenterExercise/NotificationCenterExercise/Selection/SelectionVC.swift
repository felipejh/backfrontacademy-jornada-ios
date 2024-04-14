//
//  SelectionVC.swift
//  NotificationCenterExercise
//
//  Created by Felipe Hoffmann on 14/04/24.
//

import UIKit

class SelectionVC: UIViewController {
    
    var selectionScreen: SelectionScreen?
    
    override func loadView() {
        selectionScreen = SelectionScreen()
        view = selectionScreen
        
        selectionScreen?.delegate(delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension SelectionVC: SelectionScreenProtocol {
    func tappedMacbookButton() {
        NotificationCenter.default.post(name: Notification.Name("macbook"), object: UIColor.red)
        dismiss(animated: true)
    }
    
    func tappedImacButton() {
        NotificationCenter.default.post(name: Notification.Name("imac"), object: nil)
        dismiss(animated: true)
    }
}
