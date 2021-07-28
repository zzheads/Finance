//
//  ServiceAssembly.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import EasyDi

final class ServicesAssembly: Assembly {
    var configParser: APIConfigurationParser {
        define(init: DefaultAPIConfigurationParser(filename: "APIConfiguration"))
    }
    
    var exchangeIdsParser: HandbookParser<ExchangeId> {
        define(scope: .lazySingleton, init: HandbookParser<ExchangeId>(filename: "ISO10383_MIC.csv"))
    }
    
    var configuration: DefaultNetworkManager.Configuration {
        .init(accessKey: configParser.accessKey, baseURL: configParser.baseURL)
    }
    
    var networkManager: NetworkManager {
        define(scope: .lazySingleton, init: DefaultNetworkManager(configuration: self.configuration))
    }
    
    var marketstack: MarketStackService {
        define(init: DefaultMarketStackService(networkManager: self.networkManager))
    }
}
