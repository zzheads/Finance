//
//  Configurable.swift
//  Finance
//
//  Created by Алексей Папин on 29.07.2021.
//

import UIKit

// MARK: - ConfigurableCell
public protocol ConfigurableCell: UITableViewCell {
    associatedtype Model    
    static var reuseIdentifier: String { get }
    static var nib: UINib { get }
    func configure(with model: Model, onUpdate: ((Model) -> Void)?)
}

extension ConfigurableCell {
    public static var reuseIdentifier: String { .init(describing: Self.self) }
    public static var nib: UINib { .init(nibName: reuseIdentifier, bundle: nil) }
}
