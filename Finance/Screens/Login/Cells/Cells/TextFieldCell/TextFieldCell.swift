//
//  TextFieldCell.swift
//  IdealInvestor
//
//  Created by Алексей Папин on 25.11.2020.
//

import SnapKit

typealias TextFieldRow = Row<TextFieldCell, TextFieldCell.Model>

class TextFieldCell: UITableViewCell {
    private struct Constants {
        static func attributed(title: String?) -> NSAttributedString? {
            guard let title = title else { return nil }
            return NSAttributedString(string: title, attributes: [.font: UIFont.mts(size: 13, weight: .regular), .foregroundColor: UIColor.Gray.iron])
        }
    }
    
    private let textField: TextField = .init()
    private let topLabel: UILabel = .init()
    private let bottomLabel: UILabel = .init()
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [topLabel, textField, bottomLabel])
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.alignment = .fill
        view.spacing = 8
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        remakeConstraints(insets: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(stackView)
    }
    
    private func remakeConstraints(insets: UIEdgeInsets) {
        stackView.snp.remakeConstraints {
            $0.edges.equalToSuperview().inset(insets)
        }
    }
}

extension TextFieldCell: ConfigurableCell {
    struct Model {
        var textFieldModel: TextField.Model
        var topTitle: String? = nil
        var bottomTitle: String? = nil
        var insets: UIEdgeInsets = .zero
    }
    
    func configure(with model: Model, onUpdate: ((Model) -> Void)?) {
        textField.configure(with: model.textFieldModel)
        topLabel.attributedText = Constants.attributed(title: model.topTitle)
        bottomLabel.attributedText = Constants.attributed(title: model.bottomTitle)
        remakeConstraints(insets: model.insets)
    }
}
