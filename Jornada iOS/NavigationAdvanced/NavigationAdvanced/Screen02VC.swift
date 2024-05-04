//
//  Screen02VC.swift
//  NavigationAdvanced
//
//  Created by Felipe Hoffmann on 29/03/24.
//

import UIKit

class Screen02VC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    let name: String
    
    init?(coder: NSCoder, name: String) {
        self.name = name
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = name
    }
}
