//
//  RowsBuilder.swift
//  Finance
//
//  Created by Папин Алексей Валерьевич on 01.08.2021.
//

import UIKit

enum RowType {
    case logo
    case button(DefaultRowsBuilder.Title, UIButton.Appearance, (() -> Void)?)
    case textField(DefaultRowsBuilder.Title, String?, Bool, ((String?) -> Void)?)
}

protocol RowsBuilder: AnyObject {
    func build(_ rows: RowType...) -> [ConfigurableRow]
}

final class DefaultRowsBuilder {
    public enum Title: String {
        case email = "Email"
        case password = "Password"
        case register = "Register"
        case rememberMe = "Remember me"
        case confirmPassword = "Confirm password"
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
    func build(_ rows: RowType...) -> [ConfigurableRow] {
        var result: [ConfigurableRow] = []
        for row in rows {
            let newRow: ConfigurableRow
            switch row {
            case .logo:
                newRow = logoRow()
            case let .button(title, appearance, handler):
                newRow = buttonRow(
                    title: title,
                    appearance: appearance,
                    handler: handler
                )
            case let .textField(title, value, isSecure, handler):
                newRow = textFieldRow(
                    title: title,
                    initialValue: value,
                    isSecureInput: isSecure,
                    handler: handler
                )
            }
            result.append(newRow)
        }
        return result
    }
    
    private func logoRow() -> ImageRow {
        return ImageRow(
            ImageCell.Model(
                height: appearance.logoHeight,
                image: appearance.logoImage,
                contentMode: appearance.logoContentMode
            )
        )
    }
    
    private func buttonRow(
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
    
    private func textFieldRow(
        title: Title,
        initialValue: String? = nil,
        isSecureInput: Bool,
        handler: ((String?) -> Void)?) -> TextFieldRow
    {
        let type: UIKeyboardType
        switch title {
        case .email: type = .emailAddress
        default: type = .default
        }
        
        let textFieldModel = TextField.Model(
            initialValue: initialValue,
            placeholder: title.rawValue,
            font: appearance.textFont,
            textColor: appearance.textColor,
            isSecureTextEntry: isSecureInput,
            keyboardType: type,
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
