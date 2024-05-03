//
//  QuotationEthTableViewCell.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 03/05/24.
//

import UIKit

class QuotationEthTableViewCell: UITableViewCell {
    
    public static let identifier = String(describing: QuotationEthTableViewCell.self)
    
    private lazy var screen: QuotationEthTableViewCellScreen = {
        let view = QuotationEthTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
    
    public func setupCell(data: QuotationEthereum) {
        screen.ethValueLabel.text = "\(data.ethValue ?? 0) ETH"
        screen.ethValueInDollarsLabel.text = "U$ \(data.valueInDollars ?? 0)"
        screen.coinEthImageView.image = UIImage(named: data.coinEthImage ?? "")
    }
}
