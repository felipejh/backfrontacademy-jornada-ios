//
//  ProfileScreen.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 04/05/24.
//

import UIKit

class ProfileScreen: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(ProfileImageTableViewCell.self, forCellReuseIdentifier: ProfileImageTableViewCell.identifier)
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    private func addElements() {
        addSubview(tableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
