//
//  MerketstackServiceError.swift
//  Finance
//
//  Created by Алексей Папин on 28.07.2021.
//

import Foundation

// MARK: - MarketstackServiceError
public struct MarketstackServiceError: Codable {
    public struct Context: Codable {
        let symbols: [Symbols]?
    }
    
    public struct Symbols: Codable {
        let key: String?
        let message: String?
    }
    
    let code: String
    let message: String
    let context: Context
}
