//
//  ButtonCell.swift
//  IdealInvestor
//
//  Created by Алексей Папин on 25.11.2020.
//

import UIKit

typealias ButtonRow = Row<ButtonCell, ButtonCell.Model>

final class ButtonCell: UITableViewCell {    
    private let button: UIButton = UIButton()
    private var tapHandler: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        remakeConstraints(height: 0, insets: .zero)
        button.addTarget(self, action: #selector(tapped(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(button)
    }
    
    private func remakeConstraints(height: CGFloat, insets: UIEdgeInsets) {
        button.snp.remakeConstraints {
            $0.height.equalTo(height)
            $0.edges.equalToSuperview().inset(insets)
        }
    }
    
    @objc private func tapped(_ sender: UIButton) {
        tapHandler?()
    }
}

extension ButtonCell: ConfigurableCell {
    class Model {
        var buttonModel: UIButton.Model
        var insets: UIEdgeInsets
        var tapHandler: (() -> Void)?
        
        init(
            buttonModel: UIButton.Model,
            insets: UIEdgeInsets = .zero,
            tapHandler: (() -> Void)?
        ) {
            self.buttonModel = buttonModel
            self.insets = insets
            self.tapHandler = tapHandler
        }
    }
    
    func configure(with model: Model, onUpdate: ((Model) -> Void)?) {
        button.configure(with: model.buttonModel)
        remakeConstraints(height: model.buttonModel.height, insets: model.insets)
        tapHandler = model.tapHandler
    }
}

extension ButtonCell.Model: HasHeight {
    var height: CGFloat { buttonModel.height + insets.top + insets.bottom }
}
