//
//  CardType.swift
//  prototypeapp
//
//  Created by Constantin Senila on 15.05.2023.
//
import SwiftUI

public enum CardType {
    case food, sports, health, none
    
    func stringForCase() -> String {
        switch self {
        case .food:
            return "FOOD"
        case .sports:
            return "SPORTS"
        case .health:
            return "HEALTH"
        case .none:
            return ""
        }
    }
    
    static func caseForString(_ string: String) -> CardType {
        switch string {
        case "FOOD":
            return .food
        case "SPORTS":
            return .sports
        case "HEALTH":
            return .health
        default:
            return none
        }
    }
}
