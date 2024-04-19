//
//  StoryCardCollectionViewCellScreen.swift
//  FirstAppMVVM
//
//  Created by Felipe Hoffmann on 15/04/24.
//

import UIKit

class StoryCardCollectionViewCellScreen: UIView {
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.setCardShadow()
        
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        cv.backgroundColor = .clear
        cv.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configProtocolsCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    private func addElements() {
        addSubview(cardView)
        cardView.addSubview(collectionView)
        collectionView.pin(to: cardView)
    }
    
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15),
        ])
    }
}
