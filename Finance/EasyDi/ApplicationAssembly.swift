//
//  AppDependencies.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import EasyDi

final class ApplicationAssembly: Assembly {
    var tabBarViewModel: TabBarViewModel {
        define(scope: .lazySingleton, init: TabBarViewModel(), inject: nil)
    }
    
    var tabBarController: TabBarController {
        define(init: TabBarController(viewModel: self.tabBarViewModel))
    }
}
