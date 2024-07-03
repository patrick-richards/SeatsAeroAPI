//
//  Route.swift
//  SeatsAeroAPI
//
//  Created on 12/6/2024.
//

import Foundation

public struct Route: Codable {
    public let id: String
    public let originAirport: String
    public let originRegion: String
    public let destinationAirport: String
    public let numDaysOut: Int
    public let distance: Int
    public let source: String
}

extension Route {
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case originAirport = "OriginAirport"
        case originRegion = "OriginRegion"
        case destinationAirport = "DestinationAirport"
        case numDaysOut = "NumDaysOut"
        case distance = "Distance"
        case source = "Source"
    }
}
