//
//  CardUserView.swift
//  prototypeapp
//
//  Created by Constantin Senila on 15.05.2023.
//

import SwiftUI

struct CardUserView: View {
    @Binding var user: UserDetails
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("User: \(user.firstName) \(user.lastName)")
                    .cardTextStyle(font: Font.verdan20(), color: Color.black)
                    .drawingGroup()
            }
            .padding([.top, .bottom], 25)
            .compositingGroup()
            
            Spacer()
        }
        .background(Color.white.cornerRadius(15))
        .padding([.leading, .trailing], 20)
        
        .clipped()
        .shadow(color: Color.black, radius: 10, x: 0, y: 0)

    }
}
