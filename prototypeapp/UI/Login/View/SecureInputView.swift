//
//  SecureInputView.swift
//  prototypeapp
//
//  Created by Constantin Senila on 06.04.2023.
//

import SwiftUI

struct SecureInputView: View {
    @Binding var text: String
    @State var isSecured: Bool = true
    var title: String

    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                        .cardTextStyle(font: Font.verdan15(), color: Color.gray)
                } else {
                    TextField(title, text: $text)
                        .cardTextStyle(font: Font.verdan15(), color: Color.gray)
                }
            }.padding(.trailing, 30)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye" : "eye.slash")
                    .accentColor(.gray)
            }
        }
    }
}
