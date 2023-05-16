//
//  CardSelectedView.swift
//  prototypeapp
//
//  Created by Constantin Senila on 16.05.2023.
//

import SwiftUI

struct CardSelectedView: View {
    @EnvironmentObject var dashboardVM: DashboardViewModel
    @Binding var card: DashboardCardModelPost
    @Binding var isShowing: Bool
    @State var selected: String = ""
    
    var screenSizeHeight = UIScreen.main.bounds.size.height / 2
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                BackdropView()
                    .blur(radius: 5.0)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        isShowing = false
                    }
                
                mainView
                    .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .animation(.easeInOut, value: 30)
        
    }
    var mainView: some View {
        VStack {
            Spacer()
            VStack(spacing: 20) {
                CardView(card: $card)
                    .padding(.top, 30)
                
                Spacer()
                
                PickerButtonView(selected: $selected, options: StatusType.getSTringList(), textSTring: "Choose the status: ")
                    .onAppear {
                        selected = card.statusType.stringForCaseThis()
                    }
                Spacer()
                HStack(spacing: 20) {
                    Button(action: {
                        isShowing = false
                    }) {
                        HStack{
                            Spacer()
                            Text("Cancel")
                                .foregroundColor(.white)
                                .padding()
                            
                            Spacer()
                        }
                        .background(Color.blue)
                        .cornerRadius(20)
                    }
                    Button(action: {
                        card.statusType = StatusType.caseForStringThis(selected)
                        dashboardVM.updateCard(card: card)
                        isShowing = false
//                        dashboardVM.reloadCards()
                    }) {
                        HStack{
                            Spacer()
                            Text("Update")
                                .foregroundColor(.white)
                                .padding()
                            
                            Spacer()
                        }
                        .background(Color.blue)
                        .cornerRadius(20)
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            .padding([.leading, .trailing], 30)
            
            Spacer()
        }
        .frame(height: screenSizeHeight)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                Rectangle()
                    .cornerRadius(50, corners: [.topLeft, .topRight])
                    .clipped()
                    .shadow(color: Color.black, radius: 10, x: 0, y: 0)
            }
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(.all)
        )
        .animation(.easeInOut(duration: 0.45), value: 30)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CardSelectedView_Previews: PreviewProvider {
    static var previews: some View {
        CardSelectedView(card: .constant(DashboardCardModelPost.init(uuid: "", cardType: "", name: "", description: "dadad", date: "", statusType: "")), isShowing: .constant(true))
    }
}
