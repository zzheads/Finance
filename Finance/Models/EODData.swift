//
//  EODData.swift
//  Finance
//
//  Created by Алексей Папин on 28.07.2021.
//

import Foundation

// MARK: - EODData
public struct EODData: Codable {
    /// Returns the exact UTC date/time the given data was collected in ISO-8601 format.
    public var date: String
    /// Returns the stock ticker symbol of the current data object.
    public var symbol: String
    /// Returns the exchange MIC identification associated with the current data object.
    public var exchange: String
    /// Returns the split factor, which is used to adjust prices when a company splits, reverse splits, or pays a distribution.
    public var split_factor: Int
    /// Returns the raw opening price of the given stock ticker.
    public var open: Double
    /// Returns the raw high price of the given stock ticker.
    public var high: Double
    /// Returns the raw low price of the given stock ticker.
    public var low: Double
    /// Returns the raw closing price of the given stock ticker.
    public var close: Double
    /// Returns the raw volume of the given stock ticker.
    public var volume: Double
    /// Returns the adjusted opening price of the given stock ticker.
    public var adj_open: Double?
    /// Returns the adjusted high price of the given stock ticker.
    public var adj_high: Double?
    /// Returns the adjusted low price of the given stock ticker.
    public var adj_low: Double?
    /// Returns the adjusted closing price of the given stock ticker.
    public var adj_close: Double?
    /// Returns the adjusted volume of given stock ticker.
    public var adj_volume: Double?
}
