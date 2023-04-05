//
//  APIConstants.swift
//  prototypeapp
//
//  Created by Senila Constantin on 13.03.2023.
//

import Foundation

class ApiConstants {
    static let basePath = "http://192.168.1.246:8081" 
    
    enum HttpMethod: String {
        case GET
        case POST
        case DELETE
        case PUT
    }
    
    
    enum URLEndpoint {
        static let login = "/api/v1/auth/authenticate"
    }
}
