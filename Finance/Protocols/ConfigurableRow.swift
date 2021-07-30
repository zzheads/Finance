//
//  ConfigurableRow.swift
//  Finance
//
//  Created by Алексей Папин on 30.07.2021.
//

import UIKit

protocol HasHeight: AnyObject {
    var height: CGFloat { get }
}

// MARK: - ConfigurableRow
public protocol ConfigurableRow {
    var reuseIdentifier: String { get }
    var nib: UINib { get }
    var type: AnyClass { get }
    var height: CGFloat { get }
    func configure(cell: UITableViewCell)
}

// MARK: - Row
public class Row<Cell: ConfigurableCell, Model>: NSObject, ConfigurableRow where Cell.Model == Model {
    private var model: Model
    private var onUpdate: ((Model) -> Void)?
    public var reuseIdentifier: String { Cell.reuseIdentifier }
    public var nib: UINib { Cell.nib }
    public var type: AnyClass { Cell.self }
    public var height: CGFloat { (model as? HasHeight)?.height ?? UITableView.automaticDimension }
    
    init(_ model: Model, onUpdate: ((Model) -> Void)? = nil) {
        self.model = model
        self.onUpdate = onUpdate
        super.init()
    }
    
    public func configure(cell: UITableViewCell) {
        (cell as? Cell)?.configure(with: model, onUpdate: onUpdate)
    }
}

