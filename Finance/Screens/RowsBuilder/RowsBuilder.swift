//
//  RowsBuilder.swift
//  Finance
//
//  Created by Папин Алексей Валерьевич on 01.08.2021.
//

import UIKit

protocol RowsBuilder: AnyObject {
    func logoRow() -> ImageRow
    func buttonRow(title: DefaultRowsBuilder.Title, appearance: UIButton.Appearance, handler: (() -> Void)?) -> ButtonRow
    
    func textFieldRow(title: DefaultRowsBuilder.Title, initialValue: String?, handler: ((String?) -> Void)?) -> TextFieldRow
    func textFieldRow(title: DefaultRowsBuilder.Title, handler: ((String?) -> Void)?) -> TextFieldRow
}

extension RowsBuilder {
    func textFieldRow(title: DefaultRowsBuilder.Title, handler: ((String?) -> Void)?) -> TextFieldRow {
        textFieldRow(title: title, initialValue: nil, handler: handler)
    }
}

final class DefaultRowsBuilder {
    public enum Title: String {
        case email = "Email"
        case password = "Password"
        case register = "Register"
        case rememberMe = "Remember me"
        
        var isSecureInput: Bool {
            switch self {
            case .password: return true
            default: return false
            }
        }
    }
    
    struct Appearance {
        typealias OffsetDivider = CGSize
        static let `default` = Appearance(screenSize: UIScreen.main.bounds.size, offsetDivider: normal)
        static let normal: OffsetDivider = OffsetDivider(width: 20, height: 70)
                        
        private let screenSize: CGSize
        private let offsetDivider: OffsetDivider
        var logoHeight: CGFloat { screenSize.height / 3 }
        private var verticalOffset: CGFloat { screenSize.height / offsetDivider.height }
        private var horizontalOffset: CGFloat { screenSize.width / offsetDivider.width }
        var cellInsets: UIEdgeInsets {
            .init(
                top: verticalOffset,
                left: horizontalOffset,
                bottom: verticalOffset,
                right: horizontalOffset)
        }
        
        init(screenSize: CGSize, offsetDivider: OffsetDivider) {
            self.screenSize = screenSize
            self.offsetDivider = offsetDivider
        }

        let logoImage: UIImage = Asset.Logo.h_blackOnWhite.image
        let logoContentMode: UIImageView.ContentMode = .scaleAspectFit
        
        let buttonAppearance: UIButton.Appearance = .green
        
        let textColor: UIColor = .Blue.blueWhale
        let textFont: UIFont = .mts(size: 13, weight: .regular)
    }
    
    private let appearance: Appearance
    
    init(appearance: Appearance = .default) {
        self.appearance = appearance
    }
}

extension DefaultRowsBuilder: RowsBuilder {
    func logoRow() -> ImageRow {
        return ImageRow(
            ImageCell.Model(
                height: appearance.logoHeight,
                image: appearance.logoImage,
                contentMode: appearance.logoContentMode
            )
        )
    }
    
    func buttonRow(
        title: Title,
        appearance: UIButton.Appearance,
        handler: (() -> Void)?) -> ButtonRow
    {
        let buttonModel = UIButton.Model(
            title: title.rawValue,
            appearance: appearance
        )
        
        return ButtonRow(
            ButtonCell.Model(
                buttonModel: buttonModel,
                insets: self.appearance.cellInsets,
                tapHandler: handler
            )
        )
    }
    
    func textFieldRow(
        title: Title,
        initialValue: String? = nil,
        handler: ((String?) -> Void)?) -> TextFieldRow
    {
        let textFieldModel = TextField.Model(
            initialValue: initialValue,
            placeholder: title.rawValue,
            font: appearance.textFont,
            textColor: appearance.textColor,
            isSecureTextEntry: title.isSecureInput,
            handler: handler
        )
        
        return TextFieldRow(
            TextFieldCell.Model(
                textFieldModel: textFieldModel,
                topTitle: title.rawValue,
                bottomTitle: nil,
                insets: appearance.cellInsets
            )
        )
    }
}
