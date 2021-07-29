//
//  LogoView.swift
//  IdealInvestor
//
//  Created by Алексей Папин on 27.11.2020.
//

import UIKit

class LogoView: UIView {
    static let reuseID = String(describing: LogoView.self)
    static let nib = UINib(nibName: reuseID, bundle: nil)
    
    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageViewAspectConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageViewBottomConstraint: NSLayoutConstraint!

    class func instanceFromNib(with model: Model) -> LogoView? {
        guard let view = LogoView.nib.instantiate(withOwner: self, options: nil).first as? LogoView else {
            return nil
        }
        view.configure(with: model)
        return view
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backView.layer.cornerRadius = backView.frame.height / 2
    }
    
    var height: CGFloat {
        [imageViewTopConstraint, imageViewHeightConstraint, imageViewBottomConstraint].compactMap { $0?.constant }.reduce(0, +)
    }

    private func updateHeightIfNeeded() {
        guard frame.height != height else { return }
        let newFrame = CGRect(origin: frame.origin, size: CGSize(width: frame.width, height: height))
        frame = newFrame
        layoutIfNeeded()
    }
}

extension LogoView {
    struct Model {
        struct Constraints {
            var top: CGFloat = 20
            var height: CGFloat = 100
            var aspect: CGFloat = 1
            var bottom: CGFloat = 20
        }
        
        let image: UIImage?
        let backgroundColor: UIColor
        let backViewColor: UIColor
        var constraints: Constraints = Constraints()
    }
    
    func configure(with model: Model) {
        imageView.image = model.image
        backgroundColor = model.backgroundColor
        backView.backgroundColor = model.backViewColor
        imageViewTopConstraint.constant = model.constraints.top
        imageViewHeightConstraint.constant = model.constraints.height
        imageViewAspectConstraint.constant = model.constraints.aspect
        imageViewBottomConstraint.constant = model.constraints.bottom
        updateHeightIfNeeded()
    }
}
