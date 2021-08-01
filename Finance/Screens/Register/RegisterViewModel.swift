//
//  RegisterViewModel.swift
//  Finance
//
//  Created by Алексей Папин on 30.07.2021.
//

import FirebaseAuth

final class RegisterViewModel: BaseViewModel {
    private struct Appearance {
        private let logoHeight: CGFloat = 200
        private let logoImage: UIImage = Asset.Logo.h_blackOnWhite.image
        private let logoContentMode: UIImageView.ContentMode = .scaleAspectFit
        
        private let buttonTitle: String = "Register"
        private let buttonAppearance: UIButton.Appearance = .green
        private let buttonInsets: UIEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20)
        
        func logoRow() -> ImageRow {
            .init(ImageCell.Model(
                    height: logoHeight,
                    image: logoImage,
                    contentMode: logoContentMode)
            )
        }
        
        func buttonRow(withHandler handler: (() -> Void)?) -> ButtonRow {
            let buttonModel = UIButton.Model(
                title: buttonTitle,
                appearance: buttonAppearance
            )
            return .init(ButtonCell.Model(
                            buttonModel: buttonModel,
                            insets: buttonInsets,
                            tapHandler: handler)
            )
        }
        
        
    }
    
    private let auth: Auth
    private let appearance = Appearance()
    lazy var rows: [ConfigurableRow] = [
        appearance.logoRow(),
        appearance.buttonRow(withHandler: nil)
    ]
    
    init(auth: Auth) {
        self.auth = auth
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        auth.addStateDidChangeListener(authStateListener(auth:user:))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        auth.removeStateDidChangeListener(self)
    }
    
    private func authStateListener(auth: Auth, user: User?) {
        
    }
}
