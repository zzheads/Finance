//
//  ConfigurableView.swift
//  Finance
//
//  Created by Алексей Папин on 30.07.2021.
//

import UIKit

// MARK: - ConfigurableView
public protocol ConfigurableView: UIView {
    associatedtype Model
    func configure(with model: Model)
}
