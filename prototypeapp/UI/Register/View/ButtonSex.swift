//
//  ButtonSex.swift
//  prototypeapp
//
//  Created by Constantin Senila on 14.04.2023.
//

import SwiftUI

struct ButtonSex: View {
    var name: String = ""
    @Binding var sexString: SexType
    
    var body: some View {
        VStack {
            Button {
                if name == "man" {
                    sexString = SexType.man
                } else if name == "woman" {
                    sexString = SexType.woman
                }
            } label: {
                ZStack {
                    Color.white
                    VStack {
                        Text(name)
                            .cardTextStyle(font: Font.verdan25(),
                                           color: Color.black.opacity(0.7))
                    }
                    .padding([.leading, .trailing], 10)
                    .padding([.top, .bottom], 40)
                    //                    .overlay(RoundedRectangle(cornerRadius: 10)
                    //                        .stroke(name == sexString.nameString() ? Color.green : Color.gray, lineWidth: 1)
                    //                        .background(ZStack {
                    //                            if name == sexString.nameString() {
                    //                                Color.green.opacity(0.1)
                    //                            } else {
                    //                                Color.white.opacity(0)
                    //                            }
                    //                        }
                    //                                    //                        .cornerRadius(10)
                    //                                   )
                    //                    )
                }
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(name == sexString.nameString() ? Color.green : Color.gray, lineWidth: 1)
                    .background(ZStack {
                        if name == sexString.nameString() {
                            Color.green.opacity(0.1)
                        } else {
                            Color.white.opacity(0)
                        }
                    }
                                
                               )
                )
//                .padding()
            }
        }
    }
}

struct ButtonSex_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSex(name: "woman", sexString: .constant(.woman))
    }
}
