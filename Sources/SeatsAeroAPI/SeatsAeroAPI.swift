//
//  SeatsAeroAPI.swift
//  SeatsAeroAPI
//
//  Created on 12/6/2024.
//

import Foundation

// documentation: https://developers.seats.aero/reference/concepts-copy
// NOTE (18.6.24): some parts of the documentation are not quite right; for example skip param is not mentioned for bulk availability.

public enum SeatsAeroAPIError: Error {
    case invalidAPIKey, userRateLimitExceeded
}

public struct SeatsAeroAPI {
    private let baseUrl = "https://seats.aero/partnerapi"
    private(set) var apiKey: String
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }

    private func request<T>(route: String, queryItems: [String: Any]?, responseType: T.Type) async throws -> T where T : Decodable {
        if self.apiKey.isEmpty {
            throw SeatsAeroAPIError.invalidAPIKey
        }

        let url = URL(string: baseUrl + route)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        
        if let queryItems = queryItems {
            components.queryItems = queryItems.map {
                URLQueryItem(name: $0.key, value: String(describing: $0.value))
            }
        }
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Partner-Authorization": self.apiKey
        ]
        
        let (data, urlResponse) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = urlResponse as? HTTPURLResponse {
            if httpResponse.statusCode == 401 {
                throw SeatsAeroAPIError.invalidAPIKey
            } else if httpResponse.statusCode == 429 {
                throw SeatsAeroAPIError.userRateLimitExceeded
            }
        }
        
        return try JSONDecoder().decode(responseType, from: data)
    }

    public func cachedSearch(origins: [Airport], destinations: [Airport], startDate: Date, endDate: Date, cabin: Cabin? = nil, take: Int? = nil, skip: Int? = nil, cursor: Int? = nil) async throws -> AvailabilityResponse {
        let originString = origins.map { $0.iata }.joined(separator: ",")
        let destinationString = destinations.map { $0.iata }.joined(separator: ",")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"

        var queryItems: [String: Any] = [
            "origin_airport": originString,
            "destination_airport": destinationString,
            "start_date": dateFormatter.string(from: startDate),
            "end_date": dateFormatter.string(from: endDate)
        ]
        
        if let cabin = cabin {
            queryItems["cabin"] = cabin.rawValue.lowercased()
        }
        
        if let take = take {
            queryItems["take"] = take
        }
        
        if let skip = skip {
            queryItems["skip"] = skip
        }

        if let cursor = cursor {
            queryItems["cursor"] = cursor
        }
        
        return try await request(route: "/search", queryItems: queryItems, responseType: AvailabilityResponse.self)
    }
    
    public func bulkAvailability(source: Source, originRegion: Region? = nil, destinationRegion: Region? = nil, startDate: Date? = nil, endDate: Date? = nil, cabin: Cabin? = nil, take: Int? = nil, skip: Int? = nil, cursor: Int? = nil) async throws -> BulkAvailabilityResponse {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        
        var queryItems: [String: Any] = [
            "source": source.rawValue
        ]
        
        if let originRegion = originRegion {
            queryItems["origin_region"] = originRegion.rawValue
        }
        
        if let destinationRegion = destinationRegion {
            queryItems["destination_region"] = destinationRegion.rawValue
        }
        
        if let startDate = startDate {
            queryItems["start_date"] = dateFormatter.string(from: startDate)
        }
        
        if let endDate = endDate {
            queryItems["end_date"] = dateFormatter.string(from: endDate)
        }
        
        if let cabin = cabin {
            queryItems["cabin"] = cabin.rawValue.lowercased()
        }
        
        if let take = take {
            queryItems["take"] = take
        }

        if let skip = skip {
            queryItems["skip"] = skip
        }

        if let cursor = cursor {
            queryItems["cursor"] = cursor
        }
        
        return try await request(route: "/availability", queryItems: queryItems, responseType: BulkAvailabilityResponse.self)
    }
    
    public func getTrips(availability: Availability) async throws -> TripResponse {
        try await request(route: "/trips/\(availability.id)", queryItems: nil, responseType: TripResponse.self)
    }
    
    public func getRoutes(_ source: Source) async throws -> [Route] {
        try await request(route: "/routes", queryItems: ["source": source.rawValue], responseType: [Route].self)
    }
}
