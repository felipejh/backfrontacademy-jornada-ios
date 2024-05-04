//
//  SelectionVC.swift
//  NotificationCenterAndProtocol
//
//  Created by Felipe Hoffmann on 14/04/24.
//

import UIKit

class SelectionVC: UIViewController {

    var selectionScreen: SelectionScreen?
    
    override func loadView() {
        selectionScreen = SelectionScreen()
        view = selectionScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectionScreen?.delegate(delegate: self)
    }

}

extension SelectionVC: SelectionScreenProtocol {
    func tappedMacbookButton() {
        NotificationCenter.default.post(name: Notification.Name("macbook"), object: nil)
        dismiss(animated: true)
    }
    
    func tappedImacButton() {
        NotificationCenter.default.post(name: NSNotification.Name("imac"), object: UIColor.cyan)
        dismiss(animated: true)
    }
}
