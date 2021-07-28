//
//  PlistParser.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import Foundation

// MARK: - InfoParser
public protocol PlistParser {
    func value<Key: RawRepresentable, T>(forKey key: Key) -> T? where Key.RawValue == String
}

// MARK: - DefaultInfoParser
public class DefaultPlistParser {
    private enum Constants: String {
        case Info
        case plist
    }
    
    typealias Dictionary = [String: Any]

    private let source: Dictionary
    
    init?(filename: String = Constants.Info.rawValue) {
        var format: PropertyListSerialization.PropertyListFormat = .xml
        guard
            let path = Bundle.main.path(forResource: filename, ofType: Constants.plist.rawValue),
            let data = FileManager.default.contents(atPath: path),
            let dict = try? PropertyListSerialization.propertyList(
                from: data,
                options: [.mutableContainersAndLeaves],
                format: &format) as? Dictionary
        else {
            return nil
        }
        self.source = dict
    }
}

// MARK: - PlistParser
extension DefaultPlistParser: PlistParser {
    public func value<Key: RawRepresentable, T>(forKey key: Key) -> T? where Key.RawValue == String {
        source[key.rawValue] as? T
    }
}
