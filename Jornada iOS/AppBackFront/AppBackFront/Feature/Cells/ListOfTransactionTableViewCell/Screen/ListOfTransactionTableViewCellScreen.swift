//
//  ListOfTransactionTableViewCellScreen.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 04/05/24.
//

import UIKit

class ListOfTransactionTableViewCellScreen: UIView {
    
    lazy var idTransactionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    lazy var transactionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    lazy var priceEthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    lazy var valueInDollarLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        
        return label
    }()
    
    lazy var dateAndHourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(idTransactionLabel)
        addSubview(transactionImageView)
        addSubview(priceEthLabel)
        addSubview(valueInDollarLabel)
        addSubview(dateAndHourLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            transactionImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            transactionImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            transactionImageView.heightAnchor.constraint(equalToConstant: 20),
            transactionImageView.widthAnchor.constraint(equalToConstant: 20),
            
            idTransactionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            idTransactionLabel.leadingAnchor.constraint(equalTo: transactionImageView.trailingAnchor, constant: 10),
            
            dateAndHourLabel.topAnchor.constraint(equalTo: idTransactionLabel.bottomAnchor, constant: 5),
            dateAndHourLabel.leadingAnchor.constraint(equalTo: idTransactionLabel.leadingAnchor),
            
            priceEthLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            priceEthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            valueInDollarLabel.topAnchor.constraint(equalTo: priceEthLabel.bottomAnchor, constant: 5),
            valueInDollarLabel.trailingAnchor.constraint(equalTo: priceEthLabel.trailingAnchor),
        ])
    }
}
