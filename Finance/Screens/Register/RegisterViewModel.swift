//
//  RegisterViewModel.swift
//  Finance
//
//  Created by Алексей Папин on 30.07.2021.
//

import FirebaseAuth

final class RegisterViewModel: BaseViewModel {
    private let auth: Auth
    var rows: [ConfigurableRow] = [
        ImageRow(UIImageView.Model(
                    height: 200,
                    image: Asset.Logo.h_blackOnWhite.image,
                    contentMode: .scaleAspectFit)
        ),
        ButtonRow(ButtonCell.Model(
                    buttonModel: UIButton.Model(title: "Register", appearance: .green),
                    insets: UIEdgeInsets(top: 40, left: 60, bottom: 8, right: 60),
                    tapHandler: nil)
        )
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
