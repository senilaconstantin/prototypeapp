//
//  GoalType.swift
//  prototypeapp
//
//  Created by Constantin Senila on 14.04.2023.
//

import Foundation

enum GoalType {
    case noType, weakening, muscle
    
    func nameString() -> String {
        switch self {
        case .weakening:
            return "weakening"
        case .muscle:
            return "muscle"
        case .noType:
            return ""
        }
    }
    
    func typeString() -> String {
        switch self {
        case .weakening:
            return "WEAKENING"
        case .muscle:
            return "MUSCLE"
        case .noType:
            return ""
        }
    }
}
