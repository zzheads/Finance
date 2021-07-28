//
//  PageResponse.swift
//  Finance
//
//  Created by Алексей Папин on 28.07.2021.
//

import Foundation

/// MARK: - Page
public class Page<Data: Codable>: Codable {
    public struct Pagination: Codable {
        /// Returns your pagination limit value.
        let limit: Int
        /// Returns your pagination offset value.
        let offset: Int
        /// Returns the results count on the current page.
        let count: Int
        /// Returns the total count of results available.
        let total: Int
    }
    
    let pagination: Pagination
    let data: Data
}
