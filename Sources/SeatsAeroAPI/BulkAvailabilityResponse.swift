//
//  BulkAvailabilityResponse.swift
//  SeatsAeroAPI
//
//  Created on 17/6/2024.
//

import Foundation

public struct BulkAvailabilityResponse: Codable {
    public let availabilities: [Availability]
    public let count: Int
    public let hasMore: Bool
    public let cursor: Int
}

extension BulkAvailabilityResponse {
    enum CodingKeys: String, CodingKey {
        case availabilities = "data"
        case count, hasMore, cursor
    }
}
