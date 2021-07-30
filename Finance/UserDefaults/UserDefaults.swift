//
//  UserDefaults.swift
//  Finance
//
//  Created by Алексей Папин on 30.07.2021.
//

import Foundation

// MARK: - UserDefaultsStore
protocol UserDefaultsStore: AnyObject {
    var email: String? { get set }
    var password: String? { get set }
    var rememberMe: Bool { get set }
}

// MARK: - DefaultUserDefaultsStore
class DefaultUserDefaultsStore {
    enum Key: String {
        case email
        case password
        case rememberMe
    }
           
    private var userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    init?(suiteName: String?) {
        guard let userDefaults = UserDefaults(suiteName: suiteName) else { return nil }
        self.userDefaults = userDefaults
    }
    
    private func value<T: Decodable>(forKey key: Key) -> T? {
        userDefaults.value(forKey: key.rawValue) as? T
    }
    
    private func set<T: Codable>(_ value: T?, forKey key: Key) {
        userDefaults.setValue(value, forKey: key.rawValue)
    }
}

extension DefaultUserDefaultsStore: UserDefaultsStore {
    enum DefaultValue {
        static let rememberMe = false
    }
    
    var email: String? {
        get { value(forKey: .email) }
        set { set(newValue, forKey: .email) }
    }
    
    var password: String? {
        get { value(forKey: .password) }
        set { set(newValue, forKey: .password) }
    }
    
    var rememberMe: Bool {
        get { value(forKey: .rememberMe) ?? DefaultValue.rememberMe }
        set { set(newValue, forKey: .rememberMe) }
    }
}

