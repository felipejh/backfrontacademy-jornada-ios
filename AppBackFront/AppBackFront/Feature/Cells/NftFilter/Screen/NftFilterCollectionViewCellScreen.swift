//
//  NftFilterCollectionViewCellScreen.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 27/04/24.
//

import UIKit

class NftFilterCollectionViewCellScreen: UIView {
    
    lazy var filterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 18
        label.textAlignment = .center
        
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
        addSubview(filterLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            filterLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            filterLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            filterLabel.heightAnchor.constraint(equalToConstant: 34),
            filterLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}
