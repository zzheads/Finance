//
//  LoginCellModels.swift
//  Finance
//
//  Created by Алексей Папин on 29.07.2021.
//

import UIKit

struct LoginCellModels {
    func loginTextField(_ initialValue: String?, handler: ((String?) -> Void)?) -> TextField.Model {
        .init(
            initialValue: initialValue,
            placeholder: "Email",
            backgroundColor: .alto,
            font: .mts(size: 12, weight: .medium),
            textColor: .darkText,
            isSecureTextEntry: false,
            handler: handler
        )
    }
    
    func passwordTextField(handler: ((String?) -> Void)?) -> TextField.Model {
        .init(
            placeholder: "Password",
            backgroundColor: .alto,
            font: .mts(size: 12, weight: .medium),
            textColor: .darkText,
            isSecureTextEntry: true,
            handler: handler
        )
    }
    
    func loginCell(_ initialValue: String?, handler: ((String?) -> Void)?) -> TextFieldCell.Model {
        .init(
            textFieldModel: loginTextField(initialValue, handler: handler),
            topTitle: "Enter email:",
            insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        )
    }

    func passwordCell(handler: ((String?) -> Void)?) -> TextFieldCell.Model {
        .init(
            textFieldModel: passwordTextField(handler: handler),
            topTitle: "Enter password:",
            insets: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        )
    }

    
    func loginButtonCell(handler: (() -> Void)?) -> ButtonCell.Model {
        let buttonModel = UIButton.Model(
            title: NSAttributedString(string: "Login", attributes: [.font: UIFont.mts(size: 13, weight: .bold)]),
            cornerRadius: 12,
            backgroundColor: .lightestBlueberry
        )
            
        return .init(
            buttonModel: buttonModel,
            edges: nil,
            tapHandler: handler
        )
    }
}
