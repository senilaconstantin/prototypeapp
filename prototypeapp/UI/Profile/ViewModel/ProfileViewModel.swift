//
//  ProfileViewModel.swift
//  prototypeapp
//
//  Created by Constantin Senila on 14.05.2023.
//

import SwiftUI

class ProfileViewModel: BaseViewModel {
    
    func actionChoose(actionProfileType: ActionProfileType) {
        switch actionProfileType {
        case .logout:
            logoutUser()
        case .delete:
            deleteUser()
        case .none:
            break
        }
    }
    
    func logoutUser() {
        CurrentUser.shared.logout()
    }
    
    func deleteUser() {
        APIClient.shared.deleteAccount(token: CurrentUser.shared.getToken()) { isOk in
            if !isOk {
                self.errorMessage = "The account could not be deleted!"
            }
        }
        
    }
}
