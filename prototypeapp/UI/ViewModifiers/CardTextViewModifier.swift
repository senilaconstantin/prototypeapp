//
//  TextFieldViewModifier.swift
//  prototypeapp
//
//  Created by Constantin Senila on 05.04.2023.
//

import SwiftUI

import SwiftUI

struct CardTextViewModifier: ViewModifier {
    var font: Font
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(color)
            .fixedSize(horizontal: false, vertical: true)
    }
}

extension View {
    func cardTextStyle(font: Font, color: Color) -> some View {
        modifier(CardTextViewModifier(font: font, color: color))
    }
}
