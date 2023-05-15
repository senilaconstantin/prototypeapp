//
//  ItemTabBar.swift
//  prototypeapp
//
//  Created by Constantin Senila on 03.05.2023.
//

import SwiftUI

struct ItemTabBar: View {
    @State private var circleSize: CGSize = .zero
    var nameImage: String
    var titleName: String
    var color: Color
    var body: some View {
        ZStack {
            Circle()
                .frame(width: circleSize.width + 20, height: circleSize.height + 20)
                .foregroundColor(Color.white)
            
            Circle()
                .stroke(Color.gray, lineWidth: 1)
                .frame(width: circleSize.width + 20, height: circleSize.height + 20)
                
            VStack {
                Image(systemName: nameImage)
                    .foregroundColor(color) // Color.primaryGreen // Color.black
                Text(titleName)
                    .cardTextStyle(font: Font.verdan15(), color: color)
            }
            .background(GeometryReader { proxy in
                Color.clear
                    .onAppear {
                        circleSize = proxy.size
                    }
            })
        }
    }
}

struct ItemTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ItemTabBar(nameImage: "homekit", titleName: "Home", color: Color.green)
    }
}
