//
//  ExchangesViewModel.swift
//  Finance
//
//  Created by Алексей Папин on 28.07.2021.
//

import Foundation

final class ExchangesViewModel: BaseViewModel {
    
    var reloadTableView: (() -> Void)?
    
    private let handbookParser: HandbookParser<ExchangeId>    
    private(set) var models: [ExchangeId]
    
    init(handbookParser: HandbookParser<ExchangeId>) {
        self.handbookParser = handbookParser
        self.models = handbookParser.models.sorted(by: { $0.country < $1.country })
    }

    override func didBindUI() {
        super.didBindUI()
        reloadTableView?()
    }
}
