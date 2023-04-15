//
//  UserDetails.swift
//  prototypeapp
//
//  Created by Constantin Senila on 14.04.2023.
//

import SwiftUI

public class UserDetails: Codable, ObservableObject {
    public var uuid: String?
    public var firstName: String
    public var lastName: String
    public var sex: String
    public var goal: String
    public var weight: Float
    
    
    public init(uuid: String?, firstName: String, lastName: String, sex: String, goal: String, weight: Float) {
        self.uuid = uuid
        self.firstName = firstName
        self.lastName = lastName
        self.sex = sex
        self.goal = goal
        self.weight = weight
    }
}
