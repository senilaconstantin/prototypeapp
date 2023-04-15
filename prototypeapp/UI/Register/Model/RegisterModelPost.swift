//
//  RegisterModelPost.swift
//  prototypeapp
//
//  Created by Constantin Senila on 14.04.2023.
//

import SwiftUI

public struct RegisterModelPost: Encodable {
    public var password: String
    public var email: String
    public var firstName: String
    public var lastName: String
    public var sex: String
    public var weight: Float
    public var goal: String
    public var role: String = "USER"
    
    public init(password: String, email: String, firstName: String, lastName: String, sex: String, weight: Float, goal: String) {
        self.password = password
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.sex = sex
        self.weight = weight
        self.goal = goal
    }
    
    enum CodingKeys: String, CodingKey {
        case password, email, firstName, lastName, sex, weight, goal
    }
}
