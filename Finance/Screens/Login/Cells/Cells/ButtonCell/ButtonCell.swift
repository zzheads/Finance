//
//  ButtonCell.swift
//  IdealInvestor
//
//  Created by Алексей Папин on 25.11.2020.
//

import UIKit

class ButtonCell: UITableViewCell {
    private struct Constants {
        static func attributed(title: String?) -> NSAttributedString? {
            guard let title = title else { return nil }
            return NSAttributedString(string: title, attributes: [.foregroundColor: UIColor.white, .font: UIFont.mts(size: 15, weight: .medium)])
        }
    }
    
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var buttonLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var buttonTrailingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var buttonTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var buttonBottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var buttonHeightConstraint: NSLayoutConstraint!
    private var tapHandler: (() -> Void)?
        
    override func awakeFromNib() {
        super.awakeFromNib()
        button.addTarget(self, action: #selector(tapped(_:)), for: .touchUpInside)
    }
    
    @objc private func tapped(_ sender: UIButton) {
        tapHandler?()
    }
}

extension ButtonCell: ConfigurableCell {
    struct Model {
        var buttonModel: UIButton.Model
        let height: CGFloat = 44
        let edges: UIEdgeInsets?
        let tapHandler: (() -> Void)?
    }
    
    func configure(with model: Model, onUpdate: ((Model) -> Void)?) {
        button.configure(with: model.buttonModel)
        buttonHeightConstraint.constant = model.height
        if let edges = model.edges {
            buttonLeadingConstraint.constant = edges.left
            buttonTrailingConstraint.constant = edges.right
            buttonTopConstraint.constant = edges.top
            buttonBottomConstraint.constant = edges.bottom
        }
        tapHandler = model.tapHandler
    }
}
