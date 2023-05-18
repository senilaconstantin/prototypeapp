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
    @State var isCardSelected: Bool = false
    @State var isShow: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selected) {
                    if selected == "Home" {
                        DashboardView(isCardSelected: $isCardSelected)
                            .environmentObject(viewModel)
                            .environmentObject(dashboardVM)
                            .tag("Home")
                    } else if selected == "Pulse" {
                        PulseView(isPulse: $isCardSelected)
                            .tag("Pulse")
                    } else if selected == "Profile" {
                        ProfileView(isShowing: $isShow)
                            .environmentObject(viewModel)
                            .environmentObject(dashboardVM)
                            .tag("Profile")
                    }
                }
            }
            
            VStack {
                Spacer()
                ZStack {
                    color
                        .cornerRadius(30, corners: [.topLeft, .topRight])
                        .edgesIgnoringSafeArea(.bottom)
                    //                        .frame(width: UIScreen.main.bounds.size.width, height: 60)
                        .ignoresSafeArea(.all)
                        .shadow(color: Color.black, radius: 10)
                    
                    HStack(alignment: .top, spacing: 40) {
                        ForEach(0..<3) { index in
                            Button(action: {
                                if !isCardSelected {
                                    selected = textsNameBar[index]
                                    if selected == "Home" {
                                        dashboardVM.reloadCards()
                                    }
                                }
                            }) {
                                ItemTabBar(nameImage: iconsBar[index], titleName: textsNameBar[index], color: selected == textsNameBar[index] ? .colorDoneCard : .gray)
                                    .padding(.top, 5)
                            }
                            .disabled(isCardSelected || isShow)
                            .offset(y: selected == textsNameBar[index] ? -10 : 0)
                        }
                    }
                    .padding(.top, 0)
                }
                .frame(width: UIScreen.main.bounds.size.width, height: 40)
            }
            .opacity(isCardSelected ? 0: 1)
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(color: Color.blue)
    }
}


