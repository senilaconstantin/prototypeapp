//
//  SplashScreen.swift
//  prototypeapp
//
//  Created by Senila Constantin on 14.03.2023.
//

import SwiftUI

struct SplashScreen: View {
    @StateObject var viewModel = SplashViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                content
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            viewModel.checkStatus()
                        }
                    }
            }
        }
    }
    
    @ViewBuilder private var content: some View {
        ZStack {
//            Color.green.ignoresSafeArea(edges: .all)
            switch viewModel.viewType {
            case .navigateToDashboard:
                navigateToDashboard
            case .navigateToLogin:
                navigateToLogin
            case .splash:
                splash
            }
        }
    }
    
    private var splash: some View {
        ZStack {
            SplashView()
        }
        .preferredColorScheme(.dark)
    }
    
    @ViewBuilder private var navigateToDashboard: some View {
        DashboardView()
            .environmentObject(viewModel)
    }
    
    private var navigateToLogin: some View {
        WelcomeView()
            .environmentObject(viewModel)
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
