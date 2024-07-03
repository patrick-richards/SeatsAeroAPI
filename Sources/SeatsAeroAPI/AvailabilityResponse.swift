//
//  AvailabilityResponse.swift
//  SeatsAeroAPI
//
//  Created on 13/6/2024.
//

import Foundation

public struct AvailabilityResponse: Decodable {
    public let availabilities: [Availability]
    public let count: Int
    public let hasMore: Bool
    public let cursor: Int
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.availabilities = try container.decode([Availability].self, forKey: .availabilities)
        self.count = try container.decode(Int.self, forKey: .count)
        self.hasMore = try container.decode(Bool.self, forKey: .hasMore)
        self.cursor = try container.decode(Int.self, forKey: .cursor)
    }
}

extension AvailabilityResponse {
    enum CodingKeys: String, CodingKey {
        case availabilities = "data"
        case count, hasMore, cursor
    }
}
