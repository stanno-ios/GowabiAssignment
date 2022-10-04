//
//  Currency.swift
//  GowabiAssignment
//
//  Created by Stanislav Rassolenko on 9/15/22.
//

import Foundation

struct CurrencyResponse: Decodable {
    let record: CurrencyRecord
    let metadata: CurrencyMetadata
}

struct CurrencyMetadata: Decodable {
    let id: String
    let metadataPrivate: Bool
    let createdAt, name: String

    enum CodingKeys: String, CodingKey {
        case id
        case metadataPrivate = "private"
        case createdAt, name
    }
}

struct CurrencyRecord: Decodable {
    let currencies: [Currency]
}

struct Currency: Decodable {
    let id: Int
    let label: String
}
