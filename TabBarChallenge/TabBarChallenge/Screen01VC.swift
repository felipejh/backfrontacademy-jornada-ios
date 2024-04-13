//
//  ViewController.swift
//  TabBarChallenge
//
//  Created by Felipe Hoffmann on 06/04/24.
//

import UIKit

class Screen01VC: UIViewController {

    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var editImageButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var listUsers: [User] = []
    let imagePicker = UIImagePickerController()
    var alert: AlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert = AlertController(controller: self)
        setupLabels()
        configTableView()
        configImagePicker()
    }

    func setupLabels() {
        view.backgroundColor = .white
        
        imgUser.image = UIImage(systemName: "person.circle.fill")
        imgUser.tintColor = .black
        imgUser.clipsToBounds = true
        imgUser.contentMode = .scaleAspectFill
        imgUser.layer.cornerRadius = imgUser.frame.height / 2
        
        editImageButton.setTitle("Editar foto", for: .normal)
        
        nameLabel.text = "Nome"
        
        nameTextField.autocapitalizationType = .words
        nameTextField.placeholder = "Digite seu nome"
        
        addButton.setTitle("Adicionar", for: .normal)
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserTableViewCell.nib(), forCellReuseIdentifier: UserTableViewCell.identifier)
    }
    
    func configImagePicker() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
    }
    
    @IBAction func nameTextFieldTappet(_ sender: UITextField) {
        print("f")
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
       
        if (nameTextField.text == "") {
            alert?.alertMessage(title: "Atenção", message: "Campo nome não foi preenchido.")
        } else {
            
            let user = User(name: nameTextField.text ?? "", image: imgUser.image ?? UIImage())
            listUsers.append(user)
            
            nameTextField.text = ""
            imgUser.image = UIImage(systemName: "person.circle.fill")
            view.endEditing(true)
            
            tableView.reloadData()
        }
    }
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        self.alert?.chooseImage(completion: { option in
            switch option {
            case .camera:
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true)
            case .library:
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true)
            case .cancel:
                break
            }
        })
        
        //        imagePicker.allowsEditing = false
        //        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        //            imagePicker.sourceType = .camera
        //        } else {
        //            imagePicker.sourceType = .photoLibrary
        //        }
        //
        //        present(imagePicker, animated: true)
    }
}

extension Screen01VC: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUsers.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
        
        cell?.setupCell(userImage: listUsers[indexPath.row].image, userName: listUsers[indexPath.row].name)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension Screen01VC: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imgUser.image = image
        }
        picker.dismiss(animated: true)
    }
}
