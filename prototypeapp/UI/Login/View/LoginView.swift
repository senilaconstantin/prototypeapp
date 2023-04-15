//
//  LoginView.swift
//  prototypeapp
//
//  Created by Constantin Senila on 06.04.2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: SplashViewModel
    @Binding var pageView: TypeScreenStart
    @State var email: String = ""
    @State var password: String = ""
    @StateObject var loginVM: LoginViewModel = .init()

    var body: some View {
        BaseView(viewModel: loginVM) {
            GeometryReader { geometry in
                Image("loginScreen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            VStack(spacing: 20) {
                Spacer()
                Text("LOGIN")
                    .cardTextStyle(font: Font.verdan45(), color: Color.gray)
                    .padding(.bottom, 20)
                AppTextField(textHeader: "Email", text: $email)

                SecureTextField(textHeader: "Password", password: $password)

                Button {
                    loginVM.loginUser(email: email, password: password) { tokenModel, error in
                        DispatchQueue.main.async {
                            if let tokenModel = tokenModel {
                                print("---\(tokenModel)") // TODO: delete
                                viewModel.viewType = .navigateToDashboard
                            } else if let error = error {
                                loginVM.errorMessage = error
//                                print("---\(error)")
                            }
                        }
                    }
                } label: {
                    HStack {
                        Spacer()
                        Text("Login")
                            .cardTextStyle(font: Font.verdan20(), color: Color.white)
                        Spacer()
                    }
                    .padding([.top, .bottom], 20)
                    .background(Color.black)
                    .cornerRadius(30)
                }

                Spacer()

                Button {
                    pageView = .register
                } label: {
                    Text("Sign up")
                        .cardTextStyle(font: Font.verdan20(), color: Color.blue)
                        .padding(.bottom, 20)
                }
            }
            .padding([.leading, .trailing], AppConstants.General.paddingLR)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(pageView: .constant(.login))
    }
}
