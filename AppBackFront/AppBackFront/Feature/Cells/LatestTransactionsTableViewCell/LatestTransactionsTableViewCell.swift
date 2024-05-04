//
//  LatestTransactionsTableViewCell.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 04/05/24.
//

import UIKit

class LatestTransactionsTableViewCell: UITableViewCell {
    
    public static let identifier: String = String(describing: LatestTransactionsTableViewCell.self)
    private var viewModel: LatestTransactionsTableViewCellViewModel = LatestTransactionsTableViewCellViewModel()
    
    private lazy var screen: LatestTransactionsTableViewCellScreen = {
        let view = LatestTransactionsTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
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
    
    public func setupCell(data: LatestTransactionsCell) {
        viewModel.setLatestTransactionsCell(data: data)
        
        screen.configTableViewProtocols(delegate: self, dataSource: self)
        screen.titleLabel.text = viewModel.title
    }
}

extension LatestTransactionsTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListOfTransactionTableViewCell.identifier, for: indexPath) as? ListOfTransactionTableViewCell
        
        cell?.setupCell(data: viewModel.loadCurrentLatestDetail(indexPath: indexPath), isInitial: viewModel.isInitial(indexPath: indexPath), isFinal: viewModel.isFinal(indexPath: indexPath))
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
}

