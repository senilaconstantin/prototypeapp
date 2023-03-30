//
//  APIClient.swift
//  prototypeapp
//
//  Created by Senila Constantin on 13.03.2023.
//
import Alamofire
import Foundation

class APIClient {
    static var shared = APIClient()
    
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
