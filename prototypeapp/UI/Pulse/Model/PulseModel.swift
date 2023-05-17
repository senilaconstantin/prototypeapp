//
//  PulseModel.swift
//  prototypeapp
//
//  Created by Constantin Senila on 15.05.2023.
//

import SwiftUI

public class PulseModel: Codable, ObservableObject {
    public var date: String
    public var pulse: Float
 
    
    public init(date: String, pulse: Float) {
        self.date = date
        self.pulse = pulse
    }
}
