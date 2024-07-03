//
//  TripAvailabilitySegment.swift
//  SeatsAeroAPI
//
//  Created on 13/6/2024.
//

import Foundation

public struct TripAvailabilitySegment: Codable {
    public let id: String
    public let routeID: String
    public let availabilityID: String
    public let availabilityTripID: String
    public let flightNumber: String
    public let distance: Int
    public let fareClass: String
    public let aircraftName: String
    public let aircraftCode: String
    public let originAirport: String
    public let destinationAirport: String
    public let departsAt: String
    public let arrivesAt: String
    public let createdAt: String
    public let updatedAt: String
    public let source: Source
    public let order: Int
}

extension TripAvailabilitySegment {
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case routeID = "RouteID"
        case availabilityID = "AvailabilityID"
        case availabilityTripID = "AvailabilityTripID"
        case flightNumber = "FlightNumber"
        case distance = "Distance"
        case fareClass = "FareClass"
        case aircraftName = "AircraftName"
        case aircraftCode = "AircraftCode"
        case originAirport = "OriginAirport"
        case destinationAirport = "DestinationAirport"
        case departsAt = "DepartsAt"
        case arrivesAt = "ArrivesAt"
        case createdAt = "CreatedAt"
        case updatedAt = "UpdatedAt"
        case source = "Source"
        case order = "Order"
    }
}
