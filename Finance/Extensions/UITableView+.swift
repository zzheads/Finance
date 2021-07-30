//
//  UITableView+.swift
//  Finance
//
//  Created by Алексей Папин on 30.07.2021.
//

import UIKit

extension UITableView {
    func registerCells(ofRows rows: [ConfigurableRow], isNibs nibs: Bool = false) {
        if nibs {
            rows.forEach { register($0.nib, forCellReuseIdentifier: $0.reuseIdentifier) }
        } else {
            rows.forEach { register($0.type, forCellReuseIdentifier: $0.reuseIdentifier) }
        }
    }
}
