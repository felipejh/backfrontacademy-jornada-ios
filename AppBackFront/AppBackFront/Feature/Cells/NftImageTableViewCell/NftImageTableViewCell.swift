//
//  NftImageTableViewCell.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 01/05/24.
//

import UIKit
import AlamofireImage

class NftImageTableViewCell: UITableViewCell {

    public static let identifier: String = String(describing: NftImageTableViewCell.self)

    private lazy var screen: NftImageTableViewCellScreen = {
        let view = NftImageTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(style: NftImageTableViewCell.CellStyle, reuseIdentifier: String?) {
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
    
    public func setupCell(urlImage: String) {
        guard let url: URL = URL(string: urlImage) else { return }
        
        screen.nftImageView.af.setImage(withURL: url)
    }
}
