//
//  FirebaseAssemblies.swift
//  Finance
//
//  Created by Алексей Папин on 30.07.2021.
//

import Firebase
import FirebaseAuth
import Swinject

class FirebaseAssembly: Assembly {
    init() {
        FirebaseApp.configure()
    }
    
    func assemble(container: Container) {
        container.register(Auth.self) { _ in
            Auth.auth()
        }.inObjectScope(.container)
    }
}

