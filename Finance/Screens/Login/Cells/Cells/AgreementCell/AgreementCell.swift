//
//  AgreementCell.swift
//  IdealInvestor
//
//  Created by Алексей Папин on 26.11.2020.
//

import UIKit

class AgreementCell: UITableViewCell {
    
    @IBOutlet private weak var `switch`: UISwitch!
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var textViewHeightConstraint: NSLayoutConstraint!
    private var onUpdate: ((Bool) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        `switch`.onTintColor = UIColor.Blue.denim
        `switch`.thumbTintColor = UIColor.Blue.blueWhale
        `switch`.addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
        textView.isUserInteractionEnabled = true
        textView.isEditable = false
        textView.linkTextAttributes = [.foregroundColor: UIColor.Blue.blueWhale]
    }
    
    @objc private func valueChanged(_ sender: UISwitch) {
        onUpdate?(sender.isOn)
    }
    
    private func height(ofAttributedText: NSAttributedString?) -> CGFloat {
        return 60
    }
}

extension AgreementCell: ConfigurableCell {
    struct Model {
        var isOn: Bool
        let message: NSAttributedString?
        var onUpdate: ((Bool) -> Void)?
    }
    
    func configure(with model: Model, onUpdate: ((Model) -> Void)?) {
        `switch`.isOn = model.isOn
        self.onUpdate = model.onUpdate
        textView.attributedText = model.message
        textViewHeightConstraint.constant = height(ofAttributedText: model.message)
    }
}
