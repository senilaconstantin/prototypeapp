//
//  DashboardView.swift
//  prototypeapp
//
//  Created by Senila Constantin on 19.03.2023.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var viewModel: SplashViewModel
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("dashboardScreen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            Text("LogOut!")
                .onTapGesture {
                    // logout
                    CurrentUser.shared.logout()
                    viewModel.viewType = .navigateToLogin
                    // ----
                }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
