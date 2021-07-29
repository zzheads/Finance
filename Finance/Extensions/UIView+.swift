//
//  UIView+.swift
//  Finance
//
//  Created by Алексей Папин on 29.07.2021.
//

import UIKit
import SnapKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }    
}
