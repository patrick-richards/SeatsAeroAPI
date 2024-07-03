//
//  Trip.swift
//  SeatsAeroAPI
//
//  Created on 13/6/2024.
//

import Foundation

public struct Trip: Codable {
    public let id: String
    public let routeId: String
    public let availabilityID: String
    public let availabilitySegments: [TripAvailabilitySegment]
    public let totalDuration: Int
    public let stops: Int
    public let carriers: String
    public let remainingSeats: Int
    public let mileageCost: Int
    public let totalTaxes: Int
    public let taxesCurrency: String
    public let taxesCurrencySymbol: String
    public let allianceCost: Int
    public let flightNumbers: String
    public let departsAt: Date
    public let cabin: String
    public let arrivesAt: Date
    public let createdAt: Date
    public let updatedAt: Date
    public let source: Source
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let dateAndTimeFormatter = ISO8601DateFormatter()
        
        let dateAndTimeFormatterWithFractionalSeconds = ISO8601DateFormatter()
        dateAndTimeFormatterWithFractionalSeconds.formatOptions = [.withFractionalSeconds]
        
        id = try values.decode(String.self, forKey: .id)
        routeId = try values.decode(String.self, forKey: .routeId)
        availabilityID = try values.decode(String.self, forKey: .availabilityID)
        availabilitySegments = try values.decode([TripAvailabilitySegment].self, forKey: .availabilitySegments)
        
        totalDuration = try values.decode(Int.self, forKey: .totalDuration)
        stops = try values.decode(Int.self, forKey: .stops)
        carriers = try values.decode(String.self, forKey: .carriers)
        remainingSeats = try values.decode(Int.self, forKey: .remainingSeats)
        mileageCost = try values.decode(Int.self, forKey: .mileageCost)
        totalTaxes = try values.decode(Int.self, forKey: .totalTaxes)
        taxesCurrency = try values.decode(String.self, forKey: .taxesCurrency)
        taxesCurrencySymbol = try values.decode(String.self, forKey: .taxesCurrencySymbol)
        allianceCost = try values.decode(Int.self, forKey: .allianceCost)
        flightNumbers = try values.decode(String.self, forKey: .flightNumbers)
        
        let departsAtDateString = try values.decode(String.self, forKey: .departsAt)
        departsAt = dateAndTimeFormatter.date(from: departsAtDateString)!
        
        cabin = try values.decode(String.self, forKey: .cabin)
        
        let arrivesAtDateString = try values.decode(String.self, forKey: .arrivesAt)
        arrivesAt = dateAndTimeFormatter.date(from: arrivesAtDateString)!
        
        let createdAtString = try values.decode(String.self, forKey: .createdAt)
        createdAt = dateAndTimeFormatterWithFractionalSeconds.date(from: createdAtString)!
        let updatedAtString = try values.decode(String.self, forKey: .updatedAt)
        updatedAt = dateAndTimeFormatterWithFractionalSeconds.date(from: updatedAtString)!
        
        let sourceName = try values.decode(String.self, forKey: .source)
        source = Source(rawValue: sourceName) ?? .unknown
    }
}

extension Trip {
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case routeId = "RouteID"
        case availabilityID = "AvailabilityID"
        case availabilitySegments = "AvailabilitySegments"
        case totalDuration = "TotalDuration"
        case stops = "Stops"
        case carriers = "Carriers"
        case remainingSeats = "RemainingSeats"
        case mileageCost = "MileageCost"
        case totalTaxes = "TotalTaxes"
        case taxesCurrency = "TaxesCurrency"
        case taxesCurrencySymbol = "TaxesCurrencySymbol"
        case allianceCost = "AllianceCost"
        case flightNumbers = "FlightNumbers"
        case departsAt = "DepartsAt"
        case cabin = "Cabin"
        case arrivesAt = "ArrivesAt"
        case createdAt = "CreatedAt"
        case updatedAt = "UpdatedAt"
        case source = "Source"
    }
}

