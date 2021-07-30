//
//  UIImageView+.swift
//  Finance
//
//  Created by Алексей Папин on 30.07.2021.
//

import UIKit
import SnapKit

extension UIImageView: ConfigurableView {
    public class Model {
        var _height: CGFloat?
        let image: UIImage?
        var insets: UIEdgeInsets
        var contentMode: UIImageView.ContentMode
        var backgroundColor: UIColor
        
        init(
            height: CGFloat? = nil,
            image: UIImage?,
            insets: UIEdgeInsets = .zero,
            contentMode: UIImageView.ContentMode = .scaleAspectFit,
            backgroundColor: UIColor = .clear
        ) {
            self._height = height
            self.image = image
            self.insets = insets
            self.contentMode = contentMode
            self.backgroundColor = backgroundColor
        }
    }
    
    public func configure(with model: Model) {
        image = model.image
        contentMode = model.contentMode
        backgroundColor = model.backgroundColor
        self.snp.remakeConstraints {
            $0.edges.equalToSuperview().inset(model.insets)
            guard let height = model._height else { return }
            $0.height.equalTo(height)
        }
    }
}

extension UIImageView.Model: HasHeight {
    public var height: CGFloat {
        _height ?? UITableView.automaticDimension
    }
}
