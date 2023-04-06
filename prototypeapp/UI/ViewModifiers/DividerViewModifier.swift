//
//  DividerViewModifier.swift
//  prototypeapp
//
//  Created by Constantin Senila on 06.04.2023.
//

import SwiftUI

struct DividerViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.gray)
            .padding([.top, .bottom], 10)
    }
}

extension View {
    func dividerStyle() -> some View {
        modifier(DividerViewModifier())
    }
}
