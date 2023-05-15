//
//  SplashViewModel.swift
//  prototypeapp
//
//  Created by Senila Constantin on 14.03.2023.
//

import SwiftUI

class SplashViewModel: BaseViewModel {
    @Published var navigateToDashboard: Bool = false
    @Published var navigateToLogin: Bool = false
    
    @Published var viewType: TypeView = .splash
    
    func checkStatus() {
        self.handleNavigationFlow()
    }
    
    private func handleNavigationFlow() {
        CurrentUser.shared.isLoggedIn { data in
            DispatchQueue.main.async {
                if data {
                    self.navigateToDashboard = true
                    self.viewType = .navigateToDashboard
                } else {
                    self.navigateToLogin = true
                    self.viewType = .navigateToLogin
                }
            }
        }
//        if CurrentUser.shared.isLoggedIn() {
//            navigateToDashboard = true
//            viewType = .navigateToDashboard
//        } else {
//            navigateToLogin = true
//            viewType = .navigateToLogin
//        }
    }
}
