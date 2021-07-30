//
//  ImageCell.swift
//  Finance
//
//  Created by Алексей Папин on 30.07.2021.
//

import SnapKit
import Nuke

typealias ImageRow = Row<ImageCell, ImageCell.Model>

final class ImageCell: UITableViewCell {
    private let _imageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        makeConstraints()
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(_imageView)
    }
    
    private func makeConstraints() {
        _imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ImageCell: ConfigurableCell {
    public func configure(with model: UIImageView.Model, onUpdate: ((UIImageView.Model) -> Void)?) {
        _imageView.configure(with: model)
    }
}
