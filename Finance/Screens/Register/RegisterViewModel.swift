//
//  RegisterViewModel.swift
//  Finance
//
//  Created by Алексей Папин on 30.07.2021.
//

import FirebaseAuth

final class RegisterViewModel: BaseViewModel {

    private let rowsBuilder: RowsBuilder = DefaultRowsBuilder()
    private let auth: Auth
    lazy var rows: [ConfigurableRow] = [
        rowsBuilder.logoRow(),
        rowsBuilder.textFieldRow(title: .email) { _ in },
        rowsBuilder.textFieldRow(title: .password) { _ in },
        rowsBuilder.buttonRow(title: .register, appearance: .blue) { }
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
