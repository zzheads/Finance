//
//  EODRequest.swift
//  Finance
//
//  Created by Алексей Папин on 28.07.2021.
//

import Alamofire

// MARK: - EODRequest
public final class EODRequest: NetworkRequest {
    public enum Parameter {
        private enum Key: String, CaseIterable {
            case symbols
            case exchange
            case sort
            case date_from
            case date_to
            case limit
            case offset
        }
        
        public enum Sort: String, CaseIterable {
            case ascending = "ASC"
            case descending = "DESC"
        }
        
        case symbols([String])
        case exchange(String)
        case sort(Sort)
        case dateFrom(String)
        case dateTo(String)
        case limit(Int)
        case offset(Int)
        
        private var key: Key {
            switch self {
            case .symbols: return .symbols
            case .exchange: return .exchange
            case .sort: return .sort
            case .dateFrom: return .date_from
            case .dateTo: return .date_to
            case .limit: return .limit
            case .offset: return .offset
            }
        }
        
        private var value: String {
            switch self {
            case let .symbols(symbols): return symbols.map { $0 }.joined(separator: ",")
            case let .exchange(exchange): return exchange
            case let .sort(sort): return sort.rawValue
            case let .dateFrom(date): return date
            case let .dateTo(date): return date
            case let .limit(limit): return "\(limit)"
            case let .offset(offset): return "\(offset)"
            }
        }
        
        public var parameter: (key: String, value: String) {
            (key: key.rawValue, value: value)
        }
    }

    private let parameters: [Parameter]
    
    public var endpoint: NetworkEndpoint { .eod }
    public var queryString: Parameters? {
        var result = Parameters()
        parameters.forEach { result.updateValue($0.parameter.value, forKey: $0.parameter.key) }
        return result
    }
    
    init(parameters: [Parameter]) {
        self.parameters = parameters
    }
}
