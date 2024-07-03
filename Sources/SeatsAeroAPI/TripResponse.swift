//
//  TripResponse.swift
//  SeatsAeroAPI
//
//  Created on 13/6/2024.
//

import Foundation

public struct TripResponse: Codable {
    public let trips: [Trip]
}

extension TripResponse {
    enum CodingKeys: String, CodingKey {
        case trips = "data"
    }
}
