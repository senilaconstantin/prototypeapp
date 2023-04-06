//
//  WelcomeView2.swift
//  prototypeapp
//
//  Created by Constantin Senila on 06.04.2023.
//

import SwiftUI

struct WelcomeView2: View {
    @Binding var pageView: TypeScreenStart
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("splashScreen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            VStack {
                Text("HELLO!")
                    .cardTextStyle(font: Font.verdan50(), color: Color.white)
                    .padding(.bottom, 20)
                Text("Start transforming the way")
                    .cardTextStyle(font: Font.verdan20(), color: Color.white)
                
                Text("you enjoy your life")
                    .cardTextStyle(font: Font.verdan20(), color: Color.white)
                    .padding(.bottom, 40)
                
                Button {
                    self.pageView = .register
                } label: {
                    HStack {
                        Spacer()
                        Text("Create account")
                            .cardTextStyle(font: Font.verdan20(), color: Color.white)
                        Spacer()
                    }
                    .padding([.top, .bottom], 20)
                    .background(Color.black)
                    .cornerRadius(30)
                }
                
                Text("or")
                    .cardTextStyle(font: Font.verdan20(), color: Color.white)
                    .padding([.bottom, .top], 30)
                
                Button {
                    self.pageView = .login
                } label: {
                    HStack {
                        Spacer()
                        Text("Login")
                            .cardTextStyle(font: Font.verdan20(), color: Color.white)
                        Spacer()
                    }
                    .padding([.top, .bottom], 20)
                    .background(Color.black)
                    .cornerRadius(30)
                }
            }
            .padding([.leading, .trailing], 25)
        }
    }
}


struct WelcomeView2_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView2(pageView: .constant(.welcome2))
    }
}
