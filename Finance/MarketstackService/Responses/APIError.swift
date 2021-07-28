//
//  MarketstackError.swift
//  Finance
//
//  Created by Алексей Папин on 28.07.2021.
//

import Foundation

public struct APIError: Codable, Swift.Error {
    private struct Error: Codable {
        private enum CodingKeys: String, CodingKey {
            case code
            case message
        }
        
        let code: String
        let message: String
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.code = try container.decode(String.self, forKey: .code)
                self.message = try container.decode(String.self, forKey: .message)
            } catch {
                print(error)
                throw error
            }
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case error
    }
    
    private let error: Error
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.error = try container.decode(Error.self, forKey: .error)
    }
}
