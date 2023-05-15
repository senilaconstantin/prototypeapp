//
//  StatusType.swift
//  prototypeapp
//
//  Created by Constantin Senila on 15.05.2023.
//

import SwiftUI
public enum StatusType {
    case ToDo, Done, none
    
    func stringForCase() -> String {
        switch self {
        case .ToDo:
            return "TODO"
        case .Done:
            return "DONE"
        case .none:
            return ""
        }
    }
    
    static func caseForString(_ string: String) -> StatusType {
        switch string {
        case "TODO":
            return .ToDo
        case "DONE":
            return .Done
        default:
            return .none
        }
    }
}

