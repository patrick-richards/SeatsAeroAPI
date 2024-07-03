//
//  Source.swift
//  SeatsAeroAPI
//
//  Created on 12/6/2024.
//

import Foundation

public enum Source: String, CaseIterable, Codable {
    case eurobonus = "eurobonus"
    case virginatlantic = "virginatlantic"
    case aeromexico = "aeromexico"
    case american = "american"
    case delta = "delta"
    case etihad = "etihad"
    case united = "united"
    case emirates = "emirates"
    case aeroplan = "aeroplan"
    case alaska = "alaska"
    case velocity = "velocity"
    case qantas = "qantas"
    case jetblue = "jetblue"
    case flyingblue = "flyingblue"
    case lifemiles = "lifemiles"
    case azul = "azul"
    case smiles = "smiles"
    
    case unknown = "unknown"
    
    public static var allSources: [Source] {
        var allCases = self.allCases
        allCases.removeAll(where: { $0 == .unknown} )
        return allCases.sorted { $0.name.lowercased() < $1.name.lowercased() }
    }
    
    public var name: String {
        switch self {
        case .eurobonus: "SAS EuroBonus"
        case .virginatlantic: "Virgin Atlantic Flying Club"
        case .aeromexico: "Aeromexico Club Premier"
        case .american: "American Airlines"
        case .delta: "Delta SkyMiles"
        case .etihad: "Etihad Guest"
        case .united: "United MileagePlus"
        case .emirates: "Emirates Skywards"
        case .aeroplan: "Air Canada Aeroplan"
        case .alaska: "Alaska Mileage Plan"
        case .velocity: "Virgin Australia Velocity"
        case .qantas: "Qantas Frequent Flyer"
        case .jetblue: "JetBlue"
        case .flyingblue: "FlyingBlue"
        case .lifemiles: "LifeMiles"
        case .azul: "Azul"
        case .smiles: "Miles&Smiles"
            
        default:
            "Unknown (\(self.rawValue))"
        }
    }
}
