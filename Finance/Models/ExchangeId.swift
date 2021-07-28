//
//  ExchangeId.swift
//  Finance
//
//  Created by Алексей Папин on 28.07.2021.
//

import Foundation

public struct ExchangeId {
    let country: String
    let isoCountryCode: String
    let mic: String
    let operatingMic: String
    let os: String
    let name: String
    let acronym: String
    let city: String
    let website: String
    let statusDate: String
    let status: String
    let creationDate: String
    let comments: String
}

extension ExchangeId: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self).replacingOccurrences(of: "\\", with: "").replacingOccurrences(of: "\"", with: "")
        let components = string.components(separatedBy: ",")
        self.country = components[0]
        self.isoCountryCode = components[1]
        self.mic = components[2]
        self.operatingMic = components[3]
        self.os = components[4]
        self.name = components[5]
        self.acronym = components[6]
        self.city = components[7]
        self.website = components[8]
        self.statusDate = components[9]
        self.status = components[10]
        self.creationDate = components[11]
        self.comments = components[12]
    }
}
