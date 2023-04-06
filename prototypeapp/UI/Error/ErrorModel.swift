//
//  ErrorModel.swift
//  prototypeapp
//
//  Created by Constantin Senila on 06.04.2023.
//

import SwiftUI

enum ErrorModel {
    case wrongCredentials, decodingError
    
    var description: String {
            switch self {
            case .wrongCredentials:
                return "Wrong Credentials!"
            case .decodingError:
                return "Data decoding error!"
            }
        }
}

//enum ErrorModel {
//    case decoding
//    case serverError(message: String)
//    
//    func errorMessage() -> String {
//        switch self {
//        case .decoding:
//            return "Decoding error!"
//        case .serverError(let message):
//            return message
//        }
//    }
//}
