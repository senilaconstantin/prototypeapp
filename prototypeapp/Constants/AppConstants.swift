//
//  Constants.swift
//  prototypeapp
//
//  Created by Constantin Senila on 07.04.2023.
//

import SwiftUI

struct AppConstants {
    
    enum ScreenSize {
        static let height: CGFloat = UIScreen.main.bounds.size.height
        static let width: CGFloat = UIScreen.main.bounds.size.width
    }
    
    enum Pulse {
        static let smallPulseOk: Float = 40.0
        static let highPulseOk: Float = 70.0
    }
    
    enum General {
        static let paddingLR: CGFloat = 40
    }
}
