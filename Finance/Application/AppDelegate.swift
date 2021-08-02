//
//  AppDelegate.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import UIKit
import Firebase
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let auth: Auth = ApplicationAssembly.resolver.resolve()
        let builder: RowsBuilder = ApplicationAssembly.resolver.resolve()
        let model = RegisterViewModel(auth: auth, builder: builder)
        let rootController = RegisterViewController(viewModel: model)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
        
        return true
    }
}

