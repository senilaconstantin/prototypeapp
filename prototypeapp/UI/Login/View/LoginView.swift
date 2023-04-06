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
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("loginScreen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            VStack(spacing: 20) {
                Text("LOGIN")
                    .cardTextStyle(font: Font.verdan45(), color: Color.gray)
                    .padding(.bottom, 20)
                AppTextField(textHeader: "Email", text: $email)
                
                SecureTextField(textHeader: "Password", password: $password)
                
                Button {
                    viewModel.viewType = .navigateToDashboard
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
                
            }.padding([.leading, .trailing], 40)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(pageView: .constant(.login))
    }
}
