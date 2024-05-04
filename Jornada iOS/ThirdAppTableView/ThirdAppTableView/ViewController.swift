//
//  ViewController.swift
//  ThirdAppTableView
//
//  Created by Felipe Hoffmann on 01/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var names = ["Felipe", "Juliana", "Dirk", "Nayara", "David"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }

    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        
        cell?.setupCell(title: names[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Nome clicado: \(names[indexPath.row]).")
    }
    
}
