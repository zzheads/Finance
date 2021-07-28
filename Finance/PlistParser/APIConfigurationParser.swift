//
//  APIConfigurationParser.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import Foundation

// MARK: - APIConfigurationParser
public protocol APIConfigurationParser: PlistParser {
    var baseURL: String? { get }
    var accessKey: (key: String, value: String)? { get }
}

// MARK: - DefaultAPIConfigurationParser
public final class DefaultAPIConfigurationParser: DefaultPlistParser {
    public enum Key: String {
        case baseURL
        case accessKey
        case key
        case value
    }
}

// MARK: - APIConfigurationParser
extension DefaultAPIConfigurationParser: APIConfigurationParser {
    public var baseURL: String? {
        value(forKey: Key.baseURL)
    }
    
    public var accessKey: (key: String, value: String)? {
        guard
            let dict: [String: String] = value(forKey: Key.accessKey),
            let key = dict[Key.key.rawValue],
            let value = dict[Key.value.rawValue]
        else {
            return nil
        }
        return (key: key, value: value)
    }
}
