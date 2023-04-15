//
//  SexType.swift
//  prototypeapp
//
//  Created by Constantin Senila on 14.04.2023.
//

import Foundation

enum SexType {
    case noType, man, woman
    
    func nameString() -> String {
        switch self {
        case .man:
            return "man"
        case .woman:
            return "woman"
        case .noType:
            return ""
        }
    }
    
    func typeString() -> String {
        switch self {
        case .man:
            return "MAN"
        case .woman:
            return "WOMAN"
        case .noType:
            return ""
        }
    }
}
