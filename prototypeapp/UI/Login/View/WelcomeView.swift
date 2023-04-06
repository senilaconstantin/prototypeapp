//
//  WelcomeView.swift
//  prototypeapp
//
//  Created by Constantin Senila on 06.04.2023.
//

import SwiftUI

struct WelcomeView: View {
    @State var page: Int = 0
    
    var body: some View {
//        ZStack {
        if page == 0 {
            content
        } else {
            ContentView()
        }
            
//        }
    }
    
    @ViewBuilder private var content: some View {
        ZStack {
            GeometryReader { geometry in
                Image("welcomeScreen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            VStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text("WELCOME")
                        .cardTextStyle(font: Font.verdan50(), color: Color.white)
                    Text("Get your plan")
                        .cardTextStyle(font: Font.verdan35(), color: Color.white)
                    Text("Create your own fitness Routine where ever you are.")
                        .cardTextStyle(font: Font.verdan20(), color: Color.white)
                    
                    HStack {
                        Spacer()
                        Button {
                            self.page = 1
                        } label: {
                            Text("NEXT")
                                .cardTextStyle(font: Font.verdan20(), color: Color.white)
                        }
                    }
                    .padding(.top, UIScreen.main.bounds.height / 4)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing], 25)
                
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
