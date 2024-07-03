//
//  Cabin.swift
//  SeatsAeroAPI
//
//  Created on 13/6/2024.
//

public enum Cabin: String, CaseIterable, Codable {
    case economy = "economy"
    case premiumEconomy = "premium"
    case business = "business"
    case first = "first"
}
