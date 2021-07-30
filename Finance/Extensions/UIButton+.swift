//
//  UIButton+.swift
//  IdealInvestor
//
//  Created by Алексей Папин on 25.11.2020.
//

import SnapKit

extension UIButton {
    public enum Appearance  {
        static let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.mts(size: 15, weight: .medium)
        ]
        static let cornerRadius: CGFloat = 6
        static let height: CGFloat = 44
        
        case green
        case blue
        case red
        
        var backgroundColor: UIColor {
            switch self {
            case .green: return .Green.persianGreen
            case .blue: return .Blue.blueWhale
            case .red: return .Red.valencia
            }
        }
    }
    
    struct Model {
        let title: NSAttributedString?
        var height: CGFloat
        var cornerRadius: CGFloat
        var backgroundColor: UIColor
        var isEnabled: Bool

        init(
            title: NSAttributedString?,
            height: CGFloat = Appearance.height,
            cornerRadius: CGFloat = Appearance.cornerRadius,
            backgroundColor: UIColor = .clear,
            isEnabled: Bool = true
        ) {
            self.title = title
            self.height = height
            self.cornerRadius = cornerRadius
            self.backgroundColor = backgroundColor
            self.isEnabled = isEnabled
        }
        
        init(title: NSAttributedString?, appearance: Appearance, isEnabled: Bool = true) {
            self.init(title: title, backgroundColor: appearance.backgroundColor, isEnabled: isEnabled)
        }
        
        init(
            title: String?,
            height: CGFloat = Appearance.height,
            cornerRadius: CGFloat = Appearance.cornerRadius,
            backgroundColor: UIColor = .clear,
            isEnabled: Bool = true
        ) {
            self.title = NSAttributedString(optString: title, attributes: Appearance.titleAttributes)
            self.height = height
            self.cornerRadius = cornerRadius
            self.backgroundColor = backgroundColor
            self.isEnabled = isEnabled
        }
        
        init(title: String?, appearance: Appearance, isEnabled: Bool = true) {
            self.init(title: title, backgroundColor: appearance.backgroundColor, isEnabled: isEnabled)
        }
    }
    
    func configure(with model: Model) {
        snp.remakeConstraints {
            $0.height.equalTo(model.height)
        }
        setAttributedTitle(model.title, for: .normal)
        backgroundColor = model.isEnabled ? model.backgroundColor : UIColor.Gray.iron
        layer.cornerRadius = model.cornerRadius
        isEnabled = model.isEnabled
    }
}
