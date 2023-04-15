//
//  RegisterView.swift
//  prototypeapp
//
//  Created by Constantin Senila on 06.04.2023.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var viewModel: SplashViewModel
    @StateObject var registerVM: RegisterViewModel = .init()
    @State var name: String = ""
    @State var email: String = ""
    @State var password1: String = ""
    @State var password2: String = ""
    @Binding var pageView: TypeScreenStart
    @State var pageRegister: Int = 1
    @State var weight: String = ""
    @State private var sexString: SexType = .noType
    @State private var goalString: GoalType = .noType
    
    
    var body: some View {
        BaseView(viewModel: registerVM) {
            GeometryReader { geometry in
                Image(pageRegister == 1 ? "loginScreen" : "registerScreen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            switch pageRegister {
            case 1:
                register1
            case 2:
                register2
            case 3:
                register3
            case 4:
                register4
            default:
                register2
            }
            
        }
    }
    private var register1: some View {
        VStack(spacing: 20) {
            Text("SIGNUP")
                .frame(maxWidth: .infinity, alignment: .leading)
                .cardTextStyle(font: Font.verdan35(), color: Color.white)
                .padding(.top, AppConstants.ScreenSize.height / 12)
            Spacer()
            
            AppTextField(textHeader: "Name", text: $name)
            AppTextField(textHeader: "Email", text: $email)
            
            SecureTextField(textHeader: "Password", password: $password1)
            SecureTextField(textHeader: "Confirm Password", password: $password2)
                .padding(.bottom, 30)
            Button {
                if registerVM.validationRegister(name: name, email: email, password1: password1, password2: password2) {
                    pageRegister = 2
                }
            } label: {
                HStack {
                    Spacer()
                    Text("Create account")
                        .cardTextStyle(font: Font.verdan20(), color: Color.white)
                    Spacer()
                }
                .padding([.top, .bottom], 20)
                .background(Color.black)
                .cornerRadius(30)
            }
            .padding([.top, .bottom], 20)
            
            HStack {
                Text("Already registered?")
                    .cardTextStyle(font: Font.verdan20(), color: Color.gray)
                Button {
                    pageView = .login
                } label: {
                    Text("Login")
                        .cardTextStyle(font: Font.verdan20(), color: Color.blue)
                }
            }
        }
        .padding([.leading, .trailing], AppConstants.General.paddingLR)
    }
    
    private var register2: some View {
        VStack(spacing: 20) {
            Text("CREATE YOUR PROFILE")
                .frame(maxWidth: .infinity, alignment: .leading)
                .cardTextStyle(font: Font.verdan20(), color: Color.white)
                .padding(.top, AppConstants.ScreenSize.height / 12)
            Text("What is")
                .frame(maxWidth: .infinity, alignment: .leading)
                .cardTextStyle(font: Font.verdan20(), color: Color.white)
                .padding(.top, AppConstants.ScreenSize.height / 12)
            Text("YOUR WEIGHT?")
                .frame(maxWidth: .infinity, alignment: .leading)
                .cardTextStyle(font: Font.verdan35(), color: Color.white)
            ZStack {
                Color.white
                VStack {
                    HStack{
                        Spacer()
                        Text("KG")
                            .frame(width: 50, height: 25)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1))
                    }
                    TextField("Weight", text: $weight)
                        .multilineTextAlignment(.center)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                        .edgesIgnoringSafeArea(.all)
                    
                    Spacer()
                }
                .padding(.all, 20)
            }
            .frame(height: AppConstants.ScreenSize.height / 6)
            .cornerRadius(10)
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    if registerVM.validationWeight(weight: weight) {
                        pageRegister = 3
                    }
                }) {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                }
                .frame(width: 50, height: 50)
                .background(Circle().foregroundColor(.black))
            }
            
        }
        .padding([.leading, .trailing], AppConstants.General.paddingLR)
    }
    
    private var register3: some View {
        VStack(spacing: 20) {
            Text("CREATE YOUR PROFILE")
                .frame(maxWidth: .infinity, alignment: .leading)
                .cardTextStyle(font: Font.verdan20(), color: Color.white)
                .padding(.top, AppConstants.ScreenSize.height / 12)
            Text("What is")
                .frame(maxWidth: .infinity, alignment: .leading)
                .cardTextStyle(font: Font.verdan20(), color: Color.white)
                .padding(.top, AppConstants.ScreenSize.height / 12)
            Text("YOUR SEX?")
                .frame(maxWidth: .infinity, alignment: .leading)
                .cardTextStyle(font: Font.verdan35(), color: Color.white)
            HStack {
                ButtonSex(name: "man", sexString: $sexString)
                ButtonSex(name: "woman", sexString: $sexString)
            }
            .frame(height: AppConstants.ScreenSize.height / 6)
            .cornerRadius(10)
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    if registerVM.validationSex(sexType: sexString) {
                        pageRegister = 4
                    }
                }) {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                }
                .frame(width: 50, height: 50)
                .background(Circle().foregroundColor(.black))
            }
        }
        .padding([.leading, .trailing], AppConstants.General.paddingLR)
    }
    
    private var register4: some View {
        VStack(spacing: 20) {
            Text("CREATE YOUR PROFILE")
                .frame(maxWidth: .infinity, alignment: .leading)
                .cardTextStyle(font: Font.verdan20(), color: Color.white)
                .padding(.top, AppConstants.ScreenSize.height / 12)
            Text("What is")
                .frame(maxWidth: .infinity, alignment: .leading)
                .cardTextStyle(font: Font.verdan20(), color: Color.white)
                .padding(.top, AppConstants.ScreenSize.height / 12)
            Text("YOUR GOAL?")
                .frame(maxWidth: .infinity, alignment: .leading)
                .cardTextStyle(font: Font.verdan35(), color: Color.white)
            HStack {
                ButtonGoal(name: GoalType.weakening.nameString(), goalType: $goalString)
                ButtonGoal(name: GoalType.muscle.nameString(), goalType: $goalString)
            }
            .frame(height: AppConstants.ScreenSize.height / 6)
            .cornerRadius(10)
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    let nameL: [String] = name.split(separator: " ").map(String.init)
                    if registerVM.validationGoal(goalType: goalString) {
                        let registerModel = RegisterModelPost(password: password1, email: email, firstName: nameL[1], lastName: nameL[0], sex: sexString.typeString(), weight: Float(weight) ?? 0, goal: goalString.typeString())
                        registerVM.register(registerModel: registerModel) { responseRegister in
                            DispatchQueue.main.async {
                                if responseRegister {
                                    viewModel.viewType = .navigateToDashboard
                                } else {
                                    print("---Error Register")
                                }
                            }
                        }
                    } else {
                        registerVM.errorMessage = "Must first and last name!"
                    }
                }) {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                }
                .frame(width: 50, height: 50)
                .background(Circle().foregroundColor(.black))
            }
            
        }
        .padding([.leading, .trailing], AppConstants.General.paddingLR)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(pageView: .constant(.register))
    }
}
