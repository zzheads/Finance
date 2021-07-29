//
//  TestViewModel.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import Foundation

final class TestViewModel: BaseViewModel {
    private let marketstack: MarketStackService
    
    init(marketstack: MarketStackService) {
        self.marketstack = marketstack
    }

    override func didBindUI() {
        super.didBindUI()
                
        marketstack.getEndOfDay(parameters: [.symbols(["GAZP.MISX"])]) { result in
            switch result {
            case let .success(page):
                print(page)
            case let .failure(error):
                print(error)
            }
        }
    }
}
