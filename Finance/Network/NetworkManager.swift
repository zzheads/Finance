//
//  NetworkManager.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import Alamofire

protocol NetworkManager: AnyObject {
    func perform(request: NetworkRequest, handler: @escaping ((Result<Data, AFError>) -> Void))
    func perform<T: Decodable>(request: NetworkRequest, handler: @escaping ((Result<T, Swift.Error>) -> Void))
}

public class DefaultNetworkManager {
    public enum Error: Swift.Error {
        case buildURL
    }
    
    public struct Configuration {
        let accessKey: (key: String, value: String)?
        let baseURL: String?
    }
    
    private let session: Session = .default
    private let configuration: Configuration
    private let decoder: JSONDecoder = .init()
    
    init(configuration: Configuration) {
        self.configuration = configuration
    }
}

extension DefaultNetworkManager: NetworkManager {
    func perform(request: NetworkRequest, handler: @escaping ((Result<Data, AFError>) -> Void)) {
        do {
            let urlRequest = try adopt(request: request)
            session.request(urlRequest).responseData { handler($0.result) }
        } catch {
            handler(.failure(AFError.createURLRequestFailed(error: error)))
        }
    }
    
    func perform<T: Decodable>(request: NetworkRequest, handler: @escaping ((Result<T, Swift.Error>) -> Void)) {
        do {
            let urlRequest = try adopt(request: request)
            session.request(urlRequest).responseData { response in
                switch response.result {
                case let .success(data):
                    do {
                        guard response.response?.statusCode == 200 else {
                            let error = try JSONDecoder().decode(APIError.self, from: data)
                            handler(.failure(error))
                            return
                        }
                        let result = try JSONDecoder().decode(T.self, from: data)
                        handler(.success(result))
                    } catch {
                        handler(.failure(error))
                    }
                    
                case let .failure(error):
                    handler(.failure(error))
                }
            }
        } catch {
            handler(.failure(AFError.createURLRequestFailed(error: error)))
        }
    }
}

extension DefaultNetworkManager {
    public func adopt(request: NetworkRequest) throws -> URLRequest {
        let fullPath = [configuration.baseURL, request.endpoint.path].compactMap { $0 }.joined(separator: "/")
        guard let url = URL(string: fullPath) else {
            throw Error.buildURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.method = request.method
        
        var queryStringParameters = request.queryString ?? Parameters()
        if let accessKey = configuration.accessKey {
            queryStringParameters.updateValue(accessKey.value, forKey: accessKey.key)
        }
        urlRequest = try URLEncoding.httpBody.encode(urlRequest, with: request.httpBody)
        urlRequest = try URLEncoding.queryString.encode(urlRequest, with: queryStringParameters)
        
        request.headers.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.name) }
        return urlRequest
    }        
}
