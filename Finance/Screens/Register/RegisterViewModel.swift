//
//  RegisterViewModel.swift
//  Finance
//
//  Created by Алексей Папин on 30.07.2021.
//

import FirebaseAuth

final class RegisterViewModel: BaseViewModel {

    private let rowsBuilder: RowsBuilder
    private let auth: Auth
    
    private var email: String?
    private var password: String?
    private var confirmPassword: String?
    
    lazy var rows: [ConfigurableRow] = rowsBuilder.build(
        .logo,
        .textField(.email, email, false, { [weak self] in self?.email = $0 }),
        .textField(.password, password, false, { [weak self] in self?.password = $0 }),
        .textField(.confirmPassword, confirmPassword, false, { [weak self] in self?.confirmPassword = $0}),
        .button(.register, .green, { [weak self] in self?.didPressRegister() })
    )
    
    init(auth: Auth, builder: RowsBuilder) {
        self.auth = auth
        self.rowsBuilder = builder
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
    
    private func didPressRegister() {
        guard
            let email = email,
            let password = password,
            let confirmPassword = confirmPassword,
            password == confirmPassword
        else { return }
        auth.createUser(
            withEmail: email,
            password: password) { result, error in
            guard let result = result, error == nil else {
                print(error)
                return
            }
        }
    }
}
