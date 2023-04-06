//
//  LoginViewModel.swift
//  prototypeapp
//
//  Created by Constantin Senila on 06.04.2023.
//

import SwiftUI

class LoginViewModel: BaseViewModel {
    func loginUser(email: String, password: String, completionHandler: @escaping (_ tokenModel: TokenModel?, _ error: String?) -> Void) {
        showLoading = true
        APIClient.shared.loginUser(email: email, password: password) { tokenModel, error in
            self.showLoading = false
            if let resultData = tokenModel {
                completionHandler(resultData, nil)
            } else {
                completionHandler(nil, error?.description)
//                self.errorMessage = error?.description
            }
        }
    }
}
