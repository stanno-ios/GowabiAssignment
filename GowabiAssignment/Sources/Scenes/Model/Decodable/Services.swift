//
//  Services.swift
//  GowabiAssignment
//
//  Created by Stanislav Rassolenko on 9/15/22.
//

import Foundation

struct ServiceResponse: Decodable {
    let record: ServiceRecord
    let metadata: ServiceMetadata
}

struct ServiceMetadata: Decodable {
    let id: String
    let metadataPrivate: Bool
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case metadataPrivate = "private"
        case createdAt
    }
}

struct ServiceRecord: Decodable {
    let services: [Service]
}

struct Service: Decodable {
    let id, currencyID: Int
    let name: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case id
        case currencyID = "currency_id"
        case name, price
    }
}
