//
//  Screen01VC.swift
//  TabarChallengeWithCamera
//
//  Created by Felipe Hoffmann on 07/04/24.
//

import UIKit

class Screen01VC: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var editPictureButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var peopleTableView: UITableView!
    
    var data: [Profile] = []
    let imagePicker = UIImagePickerController()
    var alert: AlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        alert = AlertController(controller: self)
        
        setupLabels()
        configTableView()
        configImagePicker()
        view.backgroundColor = .systemGray6
    }
    
    func setupLabels() {
        profileImageView.image = UIImage(systemName: "person.circle.fill")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.tintColor = .black
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        
        editPictureButton.setTitle("Edit picture", for: .normal)
        
        nameLabel.text = "Name"
        
        nameTextField.autocapitalizationType = .words
        
        addButton.setTitle("Add +", for: .normal)
    }
    
    func configTableView() {
        peopleTableView.delegate = self
        peopleTableView.dataSource = self
        peopleTableView.register(PeopleTableViewCell.nib(), forCellReuseIdentifier: PeopleTableViewCell.identifier)
    }
    
    func configImagePicker() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
    }
    
    @IBAction func tappedEditPictureButton(_ sender: UIButton) {
        
            
            self.alert?.chooseImage { option in
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
            }
        
    }
    
    @IBAction func tappedAddButton(_ sender: UIButton) {
        let name = nameTextField.text
        let picture = profileImageView.image
        
        if name == "" {
            self.alert?.alertMessage(title: "Form error", message: "Name field should be filled")
        } else {
            
            let profile = Profile(name: name ?? "", picture: picture ?? UIImage())
            
            data.append(profile)
            nameTextField.text = ""
            profileImageView.image = UIImage(systemName: "person.circle.fill")
            view.endEditing(true)
            peopleTableView.reloadData()
        }
    }
    
}

extension Screen01VC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = peopleTableView.dequeueReusableCell(withIdentifier: PeopleTableViewCell.identifier, for: indexPath) as? PeopleTableViewCell
        cell?.setupCell(profile: data[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

extension Screen01VC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.profileImageView.image = image
        }
        
        picker.dismiss(animated: true)
    }
}
