//
//  RegisterViewModel.swift
//  prototypeapp
//
//  Created by Constantin Senila on 07.04.2023.
//

import SwiftUI

class RegisterViewModel: BaseViewModel {
    func register(registerModel: RegisterModelPost, responseRegister: @escaping (_ responseRegister: Bool) -> Void) {
        showLoading = true
        APIClient.shared.registerUser(model: registerModel) { tokenModel, error in
            self.showLoading = false
            if let _ = tokenModel {
                responseRegister(true)
            } else if let errorMessage = error {
                self.errorMessage = errorMessage.description
                responseRegister(false)
            }
        }
    }
    
    func validationRegister(name: String, email: String, password1: String, password2: String) -> Bool {
        var error: String = ""
        if name.split(separator: " ").map(String.init).count < 2 {
            error = "first name and last name, "
        }
        
        if !email.contains("@") {
            error = "\(error)the email must contain '@', "
        }
        
        if password1 != password2 {
            error = "\(error)passwords must be the same!"
        }
        
        if error.last == " " {
            error = String(error.dropLast(2))
            error = "\(error)!"
        }
        
        if !error.isEmpty {
            error = "Errors: \(error)"
            self.errorMessage = error
            return false
        }
        
        return true
    }
    
    func validationWeight(weight: String) -> Bool {
        let weight1 = Float(weight) ?? 0
        if weight1 < 1 {
            self.errorMessage = "A valid number must be entered!"
            return false
        }
        return true
    }
    
    func validationSex(sexType: SexType) -> Bool {
        if sexType == .noType {
            self.errorMessage = "The gender must be chosen!"
            return false
        }
        return true
    }
    
    func validationGoal(goalType: GoalType) -> Bool {
        if goalType == .noType {
            self.errorMessage = "The goal must be chosen!"
            return false
        }
        return true
    }
    
//    func weightFloat(weight: String) -> Float {
//        let weightF = Float(weight) ?? 0
//        return weightF
//    }
    
}
