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
    
    lazy var rows: [ConfigurableRow] = rowsBuilder.build(
        .logo,
        .textField(.email, nil, nil),
        .textField(.password, nil, nil),
        .button(.register, .green, nil)
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
}
