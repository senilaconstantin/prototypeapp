//
//  ProfileView.swift
//  prototypeapp
//
//  Created by Constantin Senila on 14.05.2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: SplashViewModel
    @EnvironmentObject var dashboardVM: DashboardViewModel
    @StateObject var profileVM: ProfileViewModel = .init()
    @State var isShowing: Bool = false
    @State var text: String = ""
    @State var actionProfileType: ActionProfileType = .none
    @State var response: Bool = false
    
    var body: some View {
        BaseView(viewModel: profileVM) {
            Color.gray.edgesIgnoringSafeArea(.all)
            GeometryReader { geometry in
                Image("dashboardScreen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            
            VStack(spacing: 30) {
                Spacer()
                CardUserView(user: $dashboardVM.userDetails)
                    
                Spacer()
                Spacer()
                
                Button {
                    isShowing.toggle()
                    text = "Are you sure you want to LogOut?"
                    actionProfileType = .logout
                } label: {
                    HStack {
                        Spacer()
                        Text("LogOut")
                            .cardTextStyle(font: Font.verdan20(), color: Color.white)
                        Spacer()
                    }
                    .padding([.top, .bottom], 20)
                    .background(Color.black)
                    .cornerRadius(30)
                }
                
                Button {
                    isShowing.toggle()
                    text = "Are you sure you want to delete this account?"
                    actionProfileType = .delete
                } label: {
                    HStack {
                        Spacer()
                        Text("Delete this account")
                            .cardTextStyle(font: Font.verdan20(), color: Color.white)
                        Spacer()
                    }
                    .padding([.top, .bottom], 20)
                    .background(Color.red)
                    .cornerRadius(30)
                }
                Spacer()
            }
            .padding([.leading, .trailing], 20)
            PopUpProfileView(isShowing: $isShowing, text: $text, actionProfileType: $actionProfileType)
                .environmentObject(viewModel)
                .environmentObject(profileVM)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
