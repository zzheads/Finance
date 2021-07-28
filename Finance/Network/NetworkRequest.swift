//
//  NetworkRequest.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import Alamofire

// MARK: - NetworkEndpoint
public enum NetworkEndpoint: String, CaseIterable {
    case eod
    
    var path: String { rawValue }
}

// MARK: - NetworkRequest
public protocol NetworkRequest {
    var endpoint: NetworkEndpoint { get }
    var method: HTTPMethod { get }
    var httpBody: Parameters? { get }
    var queryString: Parameters? { get }
    var headers: HTTPHeaders { get }
}

// MARK: -
extension NetworkRequest {
    public var method: HTTPMethod { .get }
    public var httpBody: Parameters? { nil }
    public var headers: HTTPHeaders { [:] }
}
