//
//  Airport.swift
//  SeatsAeroAPI
//
//  Created on 13/6/2024.
//

import Foundation

public struct Airport: Codable, Equatable {
    public let iata: String
    public let name: String
    public let latitude: Double
    public let longitude: Double
    
    public static func withIdentifier(_ identifier: String?) -> Airport? {
        allAirports().first { airport in
            airport.iata == identifier
        }
    }
    
    public static func allAirports() -> [Airport] {
        guard let url = Bundle.module.url(forResource: "airports", withExtension: "json") else {
            fatalError("Failed to locate airports.json.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load airports.json.")
        }
        
        let decoder = JSONDecoder()
        do {
            let results = try decoder.decode([Airport].self, from: data)
            return results
        } catch {
            fatalError("Failed to decode airports.json")
        }
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.iata == rhs.iata
    }
}
