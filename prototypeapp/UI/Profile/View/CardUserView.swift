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
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "exclamationmark.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                        .foregroundColor(Color.black)
                    Text("\(user.goal)")
                        .cardTextStyle(font: Font.verdanBold20(), color: Color.black)
                }
                Text("Current: \(String(format: "%.1f", user.weight)) Kg")
                    .cardTextStyle(font: Font.verdan20(), color: Color.black)
            }
            .padding([.top, .bottom], 25)
            .padding([.leading, .trailing])
            .compositingGroup()
            
            Spacer()
        }
        .background(Color.white.cornerRadius(15))
//        .padding([.leading, .trailing], 20)
        
        .clipped()
        .shadow(color: Color.black, radius: 5, x: 0, y: 0)

    }
}
