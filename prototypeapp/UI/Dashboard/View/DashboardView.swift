//
//  DashboardView.swift
//  prototypeapp
//
//  Created by Senila Constantin on 19.03.2023.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var viewModel: SplashViewModel
    @StateObject var dashboardVM: DashboardViewModel = .init()
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("dashboardScreen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            VStack {
                Text("LogOut!")
                    .cardTextStyle(font: Font.verdan35(), color: Color.blue)
                    .onTapGesture {
                        // logout
                        CurrentUser.shared.logout()
                        viewModel.viewType = .navigateToLogin
                        // ----
                    }
                Text("\(dashboardVM.userDetails.firstName) \(dashboardVM.userDetails.lastName)")
                    .cardTextStyle(font: Font.verdan25(), color: Color.black)
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
