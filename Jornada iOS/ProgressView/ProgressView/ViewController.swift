//
//  ViewController.swift
//  ProgressView
//
//  Created by Felipe Hoffmann on 29/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        progressView.progress = 0.7
        progressView.tintColor = .green
        progressView.trackTintColor = .lightGray.withAlphaComponent(0.6)
        let total = Progress(totalUnitCount: 100)
        total.completedUnitCount = 89
        progressView.setProgress(Float(total.fractionCompleted), animated: true)
    }


}

