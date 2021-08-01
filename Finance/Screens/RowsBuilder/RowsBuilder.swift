//
//  RowsBuilder.swift
//  Finance
//
//  Created by Папин Алексей Валерьевич on 01.08.2021.
//

import UIKit

protocol RowsBuilder: AnyObject {
    
}

final class DefaultRowsBuilder {
    
}

extension DefaultRowsBuilder: RowsBuilder {
    private static let logoHeight: CGFloat = 200
    private static let logoImage: UIImage = Asset.Logo.h_blackOnWhite.image
    private static let logoContentMode: UIImageView.ContentMode = .scaleAspectFit
    
    private static let buttonTitle: String = "Register"
    private static let buttonAppearance: UIButton.Appearance = .green
    private static let buttonInsets: UIEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20)
    
    func logoRow() -> ImageRow {
        .init(ImageCell.Model(
                height: DefaultRowsBuilder.logoHeight,
                image: DefaultRowsBuilder.logoImage,
                contentMode: DefaultRowsBuilder.logoContentMode)
        )
    }
    
    func buttonRow(withHandler handler: (() -> Void)?) -> ButtonRow {
        let buttonModel = UIButton.Model(
            title: DefaultRowsBuilder.buttonTitle,
            appearance: DefaultRowsBuilder.buttonAppearance
        )
        
        return .init(ButtonCell.Model(
                        buttonModel: buttonModel,
                        insets: DefaultRowsBuilder.buttonInsets,
                        tapHandler: handler)
        )
    }
    
    func emailTextField(withHandler handler: ((String?) -> Void)?) -> Text
}
