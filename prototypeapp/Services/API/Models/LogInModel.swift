//
//  LogInModel.swift
//  prototypeapp
//
//  Created by Senila Constantin on 13.03.2023.
//

import SwiftUI

public struct LogInModel: Encodable {
    public var password: String
    public var email: String
    
    public init(password: String, email: String) {
        self.password = password
        self.email = email
    }
    enum CodingKeys: String, CodingKey {
        case password, email
    }
}
