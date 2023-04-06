//
//  ContentView.swift
//  prototypeapp
//
//  Created by Senila Constantin on 03.01.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: SplashViewModel
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea([.all])
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        let log: LogInModel = .init(email: "costy@gmail.com", password: "1234")
                        APIClient.shared.login(model: log) { data in
                            if let resultData = data {
                                guard let decodedData = try? JSONDecoder().decode(TokenModel.self, from: resultData) else {
                                    return
                                }
                                print("---\(decodedData.token)")
                                
                                CurrentUser.shared.saveToken(tokenModel: TokenModel.init(token: decodedData.token))
                                viewModel.checkStatus()
                                
                            } else {
                                print("Eroare la login!")
                            }
                        }
                    }
                Text("Project setup 1")
            }
            .padding()
        }
        //        .onAppear {
        //            let log: LogInModel = .init(password: "1234", email: "costy@gmail.com")
        //            APIClient.shared.login(model: log) { data in
        //                if let resultData = data {
        //                    guard let decodedData = try? JSONDecoder().decode(TokenModel.self, from: resultData) else {
        //                        return
        //                    }
        //                    print("---\(decodedData.token ?? "")")
        //                } else {
        //                    print("Eroare la login!")
        //                }
        //            }
        //        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
