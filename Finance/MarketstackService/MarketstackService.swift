//
//  MarketstackService.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import Alamofire

protocol MarketStackService: AnyObject {
    func getEndOfDay(parameters: [EODRequest.Parameter], completion: @escaping (Result<Page<[EODData]>, Error>) -> Void)
}

class DefaultMarketStackService {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
}

extension DefaultMarketStackService: MarketStackService {
    func getEndOfDay(parameters: [EODRequest.Parameter], completion: @escaping (Result<Page<[EODData]>, Error>) -> Void) {
        let request = EODRequest(parameters: parameters)
        networkManager.perform(request: request) { completion($0) }
    }
}
