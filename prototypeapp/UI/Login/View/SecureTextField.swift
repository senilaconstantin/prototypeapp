//
//  SecureTextField.swift
//  prototypeapp
//
//  Created by Constantin Senila on 06.04.2023.
//

import SwiftUI

struct SecureTextField: View {
    var textHeader: String
    @Binding var password: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(textHeader)
                .cardTextStyle(font: Font.verdan15(), color: Color.gray)
            SecureInputView(text: $password, title: "Type here your \(textHeader.lowercased())")
            Divider()
                .dividerStyle()
        }
    }
}

struct SecureTextField_Previews: PreviewProvider {
    static var previews: some View {
        SecureTextField(textHeader: "password", password: .constant(""))
    }
}
