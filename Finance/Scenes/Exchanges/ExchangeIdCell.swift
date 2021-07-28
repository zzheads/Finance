//
//  ExchangeIdCell.swift
//  Finance
//
//  Created by Алексей Папин on 28.07.2021.
//

import UIKit
import SnapKit

final class ExchangeIdCell: UITableViewCell {
    static let identifier = String(describing: ExchangeIdCell.self)
    
    private let micLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 11)
        return label
    }()

    private let countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [countryLabel, micLabel, nameLabel])
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .center
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(stackView)
    }
    
    private func makeConstraints() {
        stackView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
    }
}

extension ExchangeIdCell {
    func configure(with model: ExchangeId) {
        micLabel.text = model.mic
        nameLabel.text = model.name
        countryLabel.text = model.country
    }
}

