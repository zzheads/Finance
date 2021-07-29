//
//  LoginViewModel.swift
//  Finance
//
//  Created by Алексей Папин on 29.07.2021.
//

import FirebaseAuth

final class LoginViewModel: BaseViewModel {
    private let cellModels = LoginCellModels()
    private var login: String? = "zzheads@gmai.com"
    private var password: String?
    
    var rows: [ConfigurableRow] {
        [
            Row<TextFieldCell, TextFieldCell.Model>(cellModels.loginCell(login, handler: { [weak self] newLogin in self?.login = newLogin })),
            Row<TextFieldCell, TextFieldCell.Model>(cellModels.passwordCell(handler: { [weak self] newPassword in self?.password = newPassword })),
            Row<ButtonCell, ButtonCell.Model>(cellModels.loginButtonCell(handler: { [weak self] in self?.didTapLogin() }))
        ]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Auth.auth().addStateDidChangeListener(authStateListener(auth:user:))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        Auth.auth().removeStateDidChangeListener(self)
    }
    
    private func authStateListener(auth: Auth, user: User?) {
        print(auth)
        print(user)
    }
    
    private func didTapLogin() {
        guard let email = login else { return }
        let settings = ActionCodeSettings()
        settings.url = URL(string: "https://finance-1dda2.web.app")
        settings.setIOSBundleID(Bundle.main.bundleIdentifier ?? "")
        settings.handleCodeInApp = true
        Auth.auth().sendSignInLink(toEmail: email, actionCodeSettings: settings) { error in
            print(error)
        }
    }
}
