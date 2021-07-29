//
//  ServiceAssembly.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import Swinject

final class ServicesAssembly: Assembly {
    private enum Contstants {
        static let apiConfigurationFileName = "APIConfiguration"
        static let exchangesHandbookFileName = "ISO10383_MIC.csv"
    }
    
    func assemble(container: Container) {
        container.register(APIConfigurationParser.self) { _ in
            DefaultAPIConfigurationParser(filename: Contstants.apiConfigurationFileName)!
        }.inObjectScope(.container)
        
        container.register(HandbookParser<ExchangeId>.self) { _ in
            HandbookParser<ExchangeId>(filename: Contstants.exchangesHandbookFileName)!
        }.inObjectScope(.container)
        
        container.register(DefaultNetworkManager.Configuration.self) { resolver in
            let parser = resolver.resolve(APIConfigurationParser.self)
            return DefaultNetworkManager.Configuration(accessKey: parser?.accessKey, baseURL: parser?.baseURL)
        }.inObjectScope(.container)
        
        container.register(NetworkManager.self) { resolver in
            let configuration = resolver.resolve(DefaultNetworkManager.Configuration.self)!
            return DefaultNetworkManager(configuration: configuration)
        }.inObjectScope(.container)
        
        container.register(MarketStackService.self) { resolver in
            let networkManager = resolver.resolve(NetworkManager.self)!
            return DefaultMarketStackService(networkManager: networkManager)
        }.inObjectScope(.container)
    }
    
}
