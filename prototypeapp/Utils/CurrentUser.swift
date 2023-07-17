//
//  CurrentUser.swift
//  prototypeapp
//
//  Created by Senila Constantin on 19.03.2023.
//

import Foundation

class CurrentUser {
    static let shared = CurrentUser()
    private let defaults = UserDefaults.standard
    
    func isLoggedIn(isLoggedInResponse: @escaping (_ data: Bool) -> Void) {
        //        var tokenR: TokenModel = .init(token: "")
        if let savedData = defaults.object(forKey: "token") as? Data {
            let decoder = JSONDecoder()
            if let token = try? decoder.decode(TokenModel.self, from: savedData) {
                
                APIClient.shared.getUserDetailsData(token: token) { data in
                    DispatchQueue.main.async {
                        if let _ = data {
                            isLoggedInResponse(true)
                        } else {
                            // TODO: aici se verifica daca refreshToken-ul este valid printr-un apel de refreshToken la backend, daca totul e ok se sterge vechiul token si se salveaza noul token, iar daca nu se trimite false user-ul fiind nevoit sa se logheze din nou
                            print("nu e valid Token-ul")
                            self.logout()
                            isLoggedInResponse(false)
                        }
                    }
                }
                
            } else {
                isLoggedInResponse(false)
            }
        } else {
            isLoggedInResponse(false)
        }
        //        return tokenR.token != ""
    }
    
    func getToken() -> TokenModel {
        var tokenR: TokenModel = .init(access_token: "", refresh_token: "")
        if let savedData = defaults.object(forKey: "token") as? Data {
            let decoder = JSONDecoder()
            if let token = try? decoder.decode(TokenModel.self, from: savedData) {
                tokenR = token
            }
        }
        return tokenR
    }
    
    func saveToken(tokenModel: TokenModel) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(tokenModel) {
            defaults.set(encodedData, forKey: "token")
        } else {
            print("Error saveToken!")
        }
    }
    
    func logout() {
        let token = TokenModel(access_token: "", refresh_token: "")
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(token) {
            defaults.set(encodedData, forKey: "token")
        } else {
            print("Error deleteToken!")
        }
    }
}
