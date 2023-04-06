//
//  AppTextField.swift
//  prototypeapp
//
//  Created by Constantin Senila on 06.04.2023.
//

import SwiftUI

struct AppTextField: View {
    var textHeader: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(textHeader)
                .cardTextStyle(font: Font.verdan15(), color: Color.gray)
            TextField("Type here your \(textHeader.lowercased())", text: $text)
                .cardTextStyle(font: Font.verdan15(), color: Color.gray)
            Divider()
                .dividerStyle()
        }
    }
}

