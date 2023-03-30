//
//  LoginResponseModel.swift
//  prototypeapp
//
//  Created by Senila Constantin on 13.03.2023.
//

import Foundation

struct TokenModel: Codable {
    var token: String

    init(token: String) {
        self.token = token
    }
}
