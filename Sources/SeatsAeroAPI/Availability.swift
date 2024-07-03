//
//  Availability.swift
//  SeatsAeroAPI
//
//  Created on 12/6/2024.
//

import Foundation

public struct Availability: Codable {
    public let id: String
    public let routeId: String
    public let route: Route
    public let date: Date
    public let parsedDate: Date
    public let YAvailable: Bool
    public let WAvailable: Bool
    public let JAvailable: Bool
    public let FAvailable: Bool
    public let YMileageCost: String
    public let WMileageCost: String
    public let JMileageCost: String
    public let FMileageCost: String
    public let YRemainingSeats: Int
    public let WRemainingSeats: Int
    public let JRemainingSeats: Int
    public let FRemainingSeats: Int
    public let YAirlines: String
    public let WAirlines: String
    public let JAirlines: String
    public let FAirlines: String
    public let YDirect: Bool
    public let WDirect: Bool
    public let JDirect: Bool
    public let FDirect: Bool
    public let source: Source
    public let createdAt: Date
    public let updatedAt: Date
    public let availabilityTrips: String
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let simpleDateFormatter = DateFormatter()
        simpleDateFormatter.dateFormat = "YYYY-MM-dd"
        
        let dateAndTimeFormatter = ISO8601DateFormatter()
        
        let dateAndTimeFormatterWithFractionalSeconds = ISO8601DateFormatter()
        dateAndTimeFormatterWithFractionalSeconds.formatOptions = [.withFractionalSeconds]
        
        id = try values.decode(String.self, forKey: .id)
        routeId = try values.decode(String.self, forKey: .routeId)
        route = try values.decode(Route.self, forKey: .route)
        
        let dateString = try values.decode(String.self, forKey: .date)
        date = simpleDateFormatter.date(from: dateString)!
        
        let parsedDateString = try values.decode(String.self, forKey: .parsedDate)
        parsedDate = dateAndTimeFormatter.date(from: parsedDateString)!
        
        YAvailable = try values.decodeIfPresent(Bool.self, forKey: .YAvailable) ?? false
        WAvailable = try values.decodeIfPresent(Bool.self, forKey: .WAvailable) ?? false
        JAvailable = try values.decodeIfPresent(Bool.self, forKey: .JAvailable) ?? false
        FAvailable = try values.decodeIfPresent(Bool.self, forKey: .FAvailable) ?? false
        YMileageCost = try values.decodeIfPresent(String.self, forKey: .YMileageCost) ?? ""
        WMileageCost = try values.decodeIfPresent(String.self, forKey: .WMileageCost) ?? ""
        JMileageCost = try values.decodeIfPresent(String.self, forKey: .JMileageCost) ?? ""
        FMileageCost = try values.decodeIfPresent(String.self, forKey: .FMileageCost) ?? ""
        YRemainingSeats = try values.decodeIfPresent(Int.self, forKey: .YRemainingSeats) ?? 0
        WRemainingSeats = try values.decodeIfPresent(Int.self, forKey: .WRemainingSeats) ?? 0
        JRemainingSeats = try values.decodeIfPresent(Int.self, forKey: .JRemainingSeats) ?? 0
        FRemainingSeats = try values.decodeIfPresent(Int.self, forKey: .FRemainingSeats) ?? 0
        YAirlines = try values.decodeIfPresent(String.self, forKey: .YAirlines) ?? ""
        WAirlines = try values.decodeIfPresent(String.self, forKey: .WAirlines) ?? ""
        JAirlines = try values.decodeIfPresent(String.self, forKey: .JAirlines) ?? ""
        FAirlines = try values.decodeIfPresent(String.self, forKey: .FAirlines) ?? ""
        YDirect = try values.decodeIfPresent(Bool.self, forKey: .YDirect) ?? false
        WDirect = try values.decodeIfPresent(Bool.self, forKey: .WDirect) ?? false
        JDirect = try values.decodeIfPresent(Bool.self, forKey: .JDirect) ?? false
        FDirect = try values.decodeIfPresent(Bool.self, forKey: .FDirect) ?? false
        
        let sourceString = try values.decode(String.self, forKey: .source)
        source = Source(rawValue: sourceString) ?? .unknown
        
        let createdAtString = try values.decode(String.self, forKey: .createdAt)
        createdAt = dateAndTimeFormatterWithFractionalSeconds.date(from: createdAtString)!
        let updatedAtString = try values.decode(String.self, forKey: .updatedAt)
        updatedAt = dateAndTimeFormatterWithFractionalSeconds.date(from: updatedAtString)!
        
        availabilityTrips = try values.decodeIfPresent(String.self, forKey: .availabilityTrips) ?? ""
    }
}

public extension Availability {
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case routeId = "RouteID"
        case route = "Route"
        case date = "Date"
        case parsedDate = "ParsedDate"
        case YAvailable = "YAvailable"
        case WAvailable = "WAvailable"
        case JAvailable = "JAvailable"
        case FAvailable = "FAvailable"
        case YMileageCost = "YMileageCost"
        case WMileageCost = "WMileageCost"
        case JMileageCost = "JMileageCost"
        case FMileageCost = "FMileageCost"
        case YRemainingSeats = "YRemainingSeats"
        case WRemainingSeats = "WRemainingSeats"
        case JRemainingSeats = "JRemainingSeats"
        case FRemainingSeats = "FRemainingSeats"
        case YAirlines = "YAirlines"
        case WAirlines = "WAirlines"
        case JAirlines = "JAirlines"
        case FAirlines = "FAirlines"
        case YDirect = "YDirect"
        case WDirect = "WDirect"
        case JDirect = "JDirect"
        case FDirect = "FDirect"
        case source = "Source"
        case createdAt = "CreatedAt"
        case updatedAt = "UpdatedAt"
        case availabilityTrips = "AvailabilityTrips"
    }
}
