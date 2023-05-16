//
//  APIClient.swift
//  prototypeapp
//
//  Created by Senila Constantin on 13.03.2023.
//
import Alamofire
import Foundation
import UIKit

class APIClient {
    static var shared = APIClient()
    
    func setToken(token: TokenModel) {
        CurrentUser.shared.saveToken(tokenModel: token)
    }
    
    func login(model: LogInModel, responseLogIn: @escaping (_ data: Data?) -> Void) {
        let urlString = "\(ApiConstants.basePath)\(ApiConstants.URLEndpoint.login)"
        
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(urlString,
                   method: .post,
                   parameters: model,
                   encoder: JSONParameterEncoder.default,
                   headers: headers)
        .response { response in
            debugPrint(response)
            DispatchQueue.main.async {
                switch response.result {
                case .success(let data):
                    responseLogIn(data)
                case .failure(let err):
                    print(err.localizedDescription)
                    responseLogIn(nil)
                }
            }
        }
    }
    
    func loginUser(email: String,
                   password: String,
                   completionHandler: @escaping (_ tokenModel: TokenModel?, _ error: ErrorModel?) -> Void) {
        let model: LogInModel = .init(email: email, password: password)
        APIClient.shared.login(model: model) { data in
            if let data = data {
                guard let result = try? JSONDecoder().decode(TokenModel.self, from: data) else {
                    completionHandler(nil, .decodingError)
                    return
                }
                DispatchQueue.main.async {
                    print(result)
                    let tokenModel = TokenModel(token: result.token)
                    APIClient.shared.setToken(token: tokenModel)
                    completionHandler(tokenModel, nil)
                }
            } else {
                completionHandler(nil, .wrongCredentials)
            }
        }
    }
    
    func register(model: RegisterModelPost, registerResponse: @escaping (_ data: Data?) -> Void) {
        let urlString = "\(ApiConstants.basePath)\(ApiConstants.URLEndpoint.register)"
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(urlString,
                   method: .post,
                   parameters: model,
                   encoder: JSONParameterEncoder.default,
                   headers: headers)
        .response { response in
            debugPrint(response)
            DispatchQueue.main.async {
                switch response.result {
                case .success(let data):
                    registerResponse(data)
                case .failure(let err):
                    print(err.localizedDescription)
                    registerResponse(nil)
                }
            }
        }
    }
    
    func registerUser(model: RegisterModelPost, completionHandler: @escaping (_ tokenModel: TokenModel?, _ error: ErrorModel?) -> Void) {
        APIClient.shared.register(model: model) { result in
            if let data = result {
                guard let result = try? JSONDecoder().decode(TokenModel.self, from: data) else {
                    completionHandler(nil, .decodingError)
                    return
                }
                DispatchQueue.main.async {
                    print(result)
                    let tokenModel = TokenModel(token: result.token)
                    APIClient.shared.setToken(token: tokenModel)
                    completionHandler(tokenModel, nil)
                }
            } else {
                completionHandler(nil, .registerError)
            }
        }
        
    }
    
    func updateCard(token: TokenModel, card: DashboardCardModelPost, responseCard: @escaping (_ error: Error?) -> Void) {
        let body: [String: Any] = ["uuid": card.uuid,
                                   "cardType": card.cardType.stringForCase(),
                                   "name": card.name,
                                   "description": card.description,
                                   "date": Date.convertStringFromDate(date: card.date),
                                   "statusType": card.statusType.stringForCase()]
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        let urlString = "\(ApiConstants.basePath)\(ApiConstants.URLEndpoint.updateCardUser)"
        guard let url = URL(string: urlString) else {
            print("url found nil")
            return
        }
        
        let accessToken = token.token // token is type TokenModel
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard data != nil, error == nil, let response = response as? HTTPURLResponse,
                  response.statusCode >= 200, response.statusCode < 300
            else {
                responseCard(error)
                print("Response Error!")
                return
            }
            responseCard(nil)
        }
        .resume()
    }
    
    func checkPulse(token: TokenModel, checkPulseResponse: @escaping (_ data: Data?) -> Void) {
        let urlString = "\(ApiConstants.basePath)\(ApiConstants.URLEndpoint.checkPulse)"
        guard let url = URL(string: urlString) else {
            print("url found nil")
            return
        }
        let accessToken = token.token // token is type TokenModel
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard data != nil, error == nil, let response = response as? HTTPURLResponse,
                  response.statusCode >= 200, response.statusCode < 300
            else {
                checkPulseResponse(nil)
                print("Response Error!")
                return
            }
            checkPulseResponse(data)
        }
        .resume()
    }
    
    func checkPulseData(token: TokenModel, pulseResponse: @escaping (_ data: PulseModel?) -> Void) {
        checkPulse(token: token) { data in
            DispatchQueue.main.async {
                if let data = data {
                    guard let result = try? JSONDecoder().decode(PulseModel.self, from: data) else {
                        pulseResponse(nil)
                        return
                    }
                    pulseResponse(result)
                } else {
                    pulseResponse(nil)
                }
            }
        }
    }
    
    func getDashboardsCards(token: TokenModel, responseCard: @escaping (_ data: Data?) -> Void) {
        let dateString = Date.convertStringFromDate(date: Date.getCurrentDate())
        let urlString = "\(ApiConstants.basePath)\(ApiConstants.URLEndpoint.getAllCardsUser)?date=\(dateString)"
        guard let url = URL(string: urlString) else {
            print("url found nil")
            return
        }
        print(urlString)
        let accessToken = token.token // token is type TokenModel
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        print(accessToken as Any)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil, let response = response as? HTTPURLResponse,
                  response.statusCode >= 200, response.statusCode < 300
            else {
                responseCard(nil)
                print("Response Error getDashboardCards!")
                return
            }
            responseCard(data)
        }
        .resume()
    }
    
    func getDashboardsCardsData(token: TokenModel, responseCard: @escaping (_ data: [DashboardCardModel]?) -> Void) {
        getDashboardsCards(token: token) { data in
            if let dataR = data {
                guard let result = try? JSONDecoder().decode([DashboardCardModel].self, from: dataR) else {
                    responseCard(nil)
                    return
                }
                responseCard(result)
            } else {
                responseCard(nil)
            }
            
        }
    }
    
    func getUserDetails(token: TokenModel, userResponse: @escaping (_ data: Data?) -> Void) {
        let urlString = "\(ApiConstants.basePath)\(ApiConstants.URLEndpoint.userDetails)"
        guard let url = URL(string: urlString) else {
            print("url found nil")
            return
        }
        print(urlString)
        let accessToken = token.token // token is type TokenModel
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        print(accessToken as Any)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil, let response = response as? HTTPURLResponse,
                  response.statusCode >= 200, response.statusCode < 300
            else {
                userResponse(nil)
                print("Response Error!")
                return
            }
            userResponse(data)
        }
        .resume()
    }
    
    func getUserDetailsData(token: TokenModel, userResponse: @escaping (_ data: UserDetails?) -> Void) {
        getUserDetails(token: token) { data in
            DispatchQueue.main.async {
                if let data = data {
                    guard let result = try? JSONDecoder().decode(UserDetails.self, from: data) else {
                        userResponse(nil)
                        return
                    }
                    userResponse(result)
                } else {
                    userResponse(nil)
                }
            }
        }
    }
    
    func deleteAccount(token: TokenModel, checkDeleteResponse: @escaping (_ isOk: Bool) -> Void) {
        let urlString = "\(ApiConstants.basePath)\(ApiConstants.URLEndpoint.deleteAccount)"
        guard let url = URL(string: urlString) else {
            print("url found nil")
            return
        }
        let accessToken = token.token // token is type TokenModel
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard data != nil, error == nil, let response = response as? HTTPURLResponse,
                  response.statusCode >= 200, response.statusCode < 300
            else {
                checkDeleteResponse(false)
                print("Response Error!")
                return
            }
            checkDeleteResponse(true)
        }
        .resume()
    }
}


//func login(model: LogInModel, responseLogIn: @escaping (_ data: Data?) -> Void) {
//    let urlString = "\(ApiConstants.basePath)\(ApiConstants.URLEndpoint.login)"
//
//    let body: [String: Any] = ["email": model.email,
//                               "password": model.password]
//    let jsonData = try? JSONSerialization.data(withJSONObject: body)
//
//    guard let url = URL(string: urlString) else {
//        print("url found nil")
//        return
//    }
//    print(urlString)
////        let accessToken = token.accessToken // token is type TokenModel
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
////        request.addValue("Bearer \(accessToken ?? "")", forHTTPHeaderField: "Authorization")
//
//    request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    request.httpBody = jsonData
//
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        guard data != nil, error == nil, let response = response as? HTTPURLResponse,
//              response.statusCode >= 200, response.statusCode < 300
//        else {
//            responseLogIn(nil)
//            print("Response Error!")
//            return
//        }
//        responseLogIn(data)
//    }
//    .resume()
////        let headers: HTTPHeaders = [
////            .contentType("application/json")
////        ]
////
////        AF.request(urlString,
////                   method: .post,
////                   parameters: model,
////                   encoder: JSONParameterEncoder.default,
////                   headers: headers)
////        .response { response in
////            debugPrint(response)
////            DispatchQueue.main.async {
////                switch response.result {
////                case .success(let data):
////                    registerResponse(data)
////                case .failure(let err):
////                    print(err.localizedDescription)
////                    registerResponse(nil)
////                }
////            }
////        }
//}
