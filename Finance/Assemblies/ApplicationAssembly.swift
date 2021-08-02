//
//  AppDependencies.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import Swinject

final class ApplicationAssembly: Assembly {
    private static let container = Container()
    
    public static let resolver: Resolver = {
        let assembler = Assembler(container: container)
        assembler.apply(assemblies: [
            ServicesAssembly(),
            FirebaseAssembly(),
            BuildersAssembly(),
            ApplicationAssembly(),
        ])
        return assembler.resolver
    }()
    
    func assemble(container: Container) {
        container.register(TabBarViewModel.self) { _ in
            TabBarViewModel()
        }.inObjectScope(.container)
        
        container.register(TabBarController.self) { resolver in
            TabBarController(viewModel: resolver.resolve(TabBarViewModel.self)!)
        }.inObjectScope(.container)        
    }
}
