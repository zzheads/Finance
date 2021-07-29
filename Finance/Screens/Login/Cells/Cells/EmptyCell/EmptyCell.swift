//
//  EmptyCell.swift
//  IdealInvestor
//
//  Created by Алексей Папин on 25.11.2020.
//

import UIKit

class EmptyCell: UITableViewCell {
    @IBOutlet private weak var emptyView: UIView!
    @IBOutlet private weak var picImageView: UIImageView!
    @IBOutlet private weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.isUserInteractionEnabled = true
        textView.isEditable = false
        textView.linkTextAttributes = [.foregroundColor: UIColor.Blue.blueWhale]
    }
}

extension EmptyCell: ConfigurableCell {
    struct Model {
        let height: CGFloat
        var backgroundColor: UIColor = .clear
        var image: UIImage? = nil
        var textViewModel: UITextView.Model? = nil
    }
    
    func configure(with model: Model, onUpdate: ((Model) -> Void)?) {
        emptyView.backgroundColor = model.backgroundColor
        heightConstraint.constant = model.height
        picImageView.image = model.image
        picImageView.isHidden = model.image == nil
        if let textViewModel = model.textViewModel {
            textView.configure(with: textViewModel)
        } else {
            textView.isHidden = true
        }
    }
}
