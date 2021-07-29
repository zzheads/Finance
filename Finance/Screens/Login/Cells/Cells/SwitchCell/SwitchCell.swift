//
//  SwitchCell.swift
//  IdealInvestor
//
//  Created by Алексей Папин on 06.12.2020.
//

import UIKit

class SwitchCell: UITableViewCell {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var `switch`: UISwitch!
    @IBOutlet private weak var label: UILabel!
    
    var handler: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        `switch`.addTarget(self, action: #selector(switched(_:)), for: .valueChanged)
    }
    
    @objc private func switched(_ sender: UISwitch) {
        handler?(sender.isOn)
    }
}

extension SwitchCell: ConfigurableCell {
    struct Model {
        var isOn: Bool
        var text: NSAttributedString?
        var handler: ((Bool) -> Void)?
    }
    
    func configure(with model: Model, onUpdate: ((Model) -> Void)?) {
        `switch`.isOn = model.isOn
        label.attributedText = model.text
        handler = model.handler
    }
}
