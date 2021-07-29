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
        let rootController = ApplicationAssembly.resolver.resolve(TabBarController.self)
        
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
        
        return true
    }
}

