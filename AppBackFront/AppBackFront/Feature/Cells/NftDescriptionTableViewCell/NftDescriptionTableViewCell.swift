//
//  NftDescriptionTableViewCell.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 01/05/24.
//

import UIKit

class NftDescriptionTableViewCell: UITableViewCell {
    
    public static let identifier: String = String(describing: NftDescriptionTableViewCell.self)

    private lazy var screen: NftDescriptionTableViewCellScreen = {
        let view = NftDescriptionTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(style: NftDescriptionTableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    private func addElements() {
        contentView.addSubview(screen)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setupCell(id: Int, title: String, description: String) {
        screen.idLabel.text = "#\(id)"
        screen.titleLabel.text = title
        screen.descriptionLabel.text = description
    }
}
