//
//  PopUpView.swift
//  prototypeapp
//
//  Created by Constantin Senila on 14.05.2023.
//

import SwiftUI

struct PopUpProfileView: View {
    @EnvironmentObject var viewModel: SplashViewModel
    @EnvironmentObject var profileVM: ProfileViewModel
    @Binding var isShowing: Bool
    @Binding var text: String
    @Binding var actionProfileType: ActionProfileType
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                BackdropView()
                    .blur(radius: 5.0)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    
                    mainView
                        .transition(.move(edge: .bottom))
                    
                    Spacer()
                }            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    var mainView: some View {
        VStack (spacing: 10) {
            HStack{
                Button {
                    isShowing = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color.white)
                }
                Spacer()
            }
            .padding([.leading, .trailing, .top], 20)
            Spacer()
            
            Text(text)
                .cardTextStyle(font: Font.verdan20(), color: Color.white)
                .padding([.leading, .trailing], 20)
            
            HStack(spacing: 20) {
                Button {
                    isShowing = false
                } label: {
                    HStack{
                        Spacer()
                        Text("No")
                            .foregroundColor(.white)
                            .padding()
                        
                        Spacer()
                    }
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding([.all], 20)
                }
                
                
                Button {
                    isShowing = false
                    profileVM.actionChoose(actionProfileType: actionProfileType)
                    viewModel.viewType = .navigateToLogin
                } label: {
                    HStack{
                        Spacer()
                        Text("Yes")
                            .foregroundColor(.white)
                            .padding()
                        
                        Spacer()
                    }
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding([.all], 20)
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 4)
        .background(Color.primaryViolet.opacity(0.9))
        .cornerRadius(20)
        .padding([.leading, .trailing], 15)
        
    }
}
