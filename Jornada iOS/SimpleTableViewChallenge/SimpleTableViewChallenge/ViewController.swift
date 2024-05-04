//
//  ViewController.swift
//  SimpleTableViewChallenge
//
//  Created by Felipe Hoffmann on 01/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var listCars: [Car] = [Car(brand: "Audi A8", brandImage: UIImage(named: "imgAudi") ?? UIImage()), Car(brand: "Corolla", brandImage: UIImage(named: "imgCorolla") ?? UIImage()), Car(brand: "HR-V", brandImage: UIImage(named: "imgHrv") ?? UIImage()), Car(brand: "Monza", brandImage: UIImage(named: "imgMonza") ?? UIImage()), Car(brand: "Opala", brandImage: UIImage(named: "imgOpala") ?? UIImage())]
//    var listCars: [String: String] = ["imgAudi": "Audi A8", "imgCorolla": "Corolla", "imgHrv": "HR-V", "imgMonza": "Monza", "imgOpala": "Opala"]
//    var listCars: [String] = ["Audi A8", "Corolla", "HR-V", "Monza", "Opala"]
    
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
        return listCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        
        cell?.setupCell(listCars[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("O carro selecionado foi o \(listCars[indexPath.row].brand).")
    }
}
