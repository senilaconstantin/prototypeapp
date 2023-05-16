//
//  APIConstants.swift
//  prototypeapp
//
//  Created by Senila Constantin on 13.03.2023.
//

import Foundation

class ApiConstants {
    static let basePath = "http://192.168.1.246:8081" //192.168.1.246
    
    enum HttpMethod: String {
        case GET
        case POST
        case DELETE
        case PUT
    }
    
    
    enum URLEndpoint {
        static let login = "/api/v1/auth/authenticate"
        static let register = "/api/v1/auth/register"
        static let userDetails = "/user/details"
        static let checkPulse = "/pulse/checkPulse"
        static let deleteAccount = "/user/delete"
        static let getAllCardsUser = "/card/get"
        static let updateCardUser = "/card/"
    }
}
