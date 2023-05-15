//
//  TabBarView.swift
//  prototypeapp
//
//  Created by Constantin Senila on 03.05.2023.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var viewModel: SplashViewModel
    @StateObject var dashboardVM: DashboardViewModel = .init()
    @State private var selected: String = "Home"
    var color: Color
    @State var textsNameBar: [String] = ["Home", "Pulse", "Profile"]
    @State var iconsBar: [String] = ["homekit", "bolt.heart", "person.crop.circle"]
    
    var body: some View {
        ZStack {
            VStack() {
                TabView(selection: $selected) {
                    //                ItemTabBar(nameImage: "homekit", titleName: "Home", color: Color.yellow)
                    DashboardView()
                        .environmentObject(viewModel)
                        .environmentObject(dashboardVM)
                        .tag("Home")
                    //                ItemTabBar(nameImage: "bolt.heart", titleName: "Pulse", color: Color.yellow)
                    PulseView()
                        .tag("Pulse")
//                    ItemTabBar(nameImage: "person.crop.circle", titleName: "Profile", color: Color.yellow)
                    ProfileView()
                        .environmentObject(viewModel)
                        .environmentObject(dashboardVM)
                        .tag("Profile")
                }
            }
            
            VStack {
                Spacer()
                ZStack {
                    color
                        .cornerRadius(40, corners: [.topLeft, .topRight])
                        .edgesIgnoringSafeArea(.bottom)
//                        .frame(width: UIScreen.main.bounds.size.width, height: 60)
                        .ignoresSafeArea(.all)
                        .shadow(color: Color.black, radius: 10)
                    
                    HStack(alignment: .top, spacing: 40) {
                        ForEach(0..<3) { index in
                            Button(action: {
                                selected = textsNameBar[index]
                            }) {
                                ItemTabBar(nameImage: iconsBar[index], titleName: textsNameBar[index], color: selected == textsNameBar[index] ? .green : .gray)
                                    .padding(.top, 5)
                            }
                            .offset(y: selected == textsNameBar[index] ? -10 : 0)
                        }
                    }
                    .padding(.top, 0)
                }
                .frame(width: UIScreen.main.bounds.size.width, height: 40)
            }
        }
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(color: Color.blue)
    }
}


