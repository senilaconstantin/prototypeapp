//
//  DashboardView.swift
//  prototypeapp
//
//  Created by Senila Constantin on 19.03.2023.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var viewModel: SplashViewModel
    @EnvironmentObject var dashboardVM: DashboardViewModel
    @State var cardSelected: DashboardCardModelPost = .init(uuid: "", cardType: "", name: "", description: "", date: "", statusType: "")
    @Binding var isCardSelected: Bool
    
    var body: some View {
        BaseView(viewModel: dashboardVM) {
            GeometryReader { geometry in
                Image("dashboardScreen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            VStack(alignment: .leading, spacing: 20) {
                Text("Welcome, \(dashboardVM.userDetails.firstName) \(dashboardVM.userDetails.lastName)")
                    .cardTextStyle(font: Font.verdan15(), color: Color.white)
                    .padding([.top], 20)
                Text("MY GOAL")
                    .cardTextStyle(font: Font.verdan25(), color: Color.white)
                
                CardUserView(user: $dashboardVM.userDetails)
                
                Spacer()
                
                VStack {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading) {
                            ForEach(dashboardVM.listCard.indices, id: \.self) { index in
                                CardView(card: $dashboardVM.listCard[index])
                                    .onTapGesture {
                                        cardSelected = dashboardVM.listCard[index]
                                        isCardSelected = true
                                    }
                            }
                            Spacer()
                                .frame(height: 20)
                        }
                    }
                }
                .padding([.top], -30)
            }
            .padding([.leading, .trailing], 20)
            //            .padding([.top], 20)
            .padding([.bottom], 1)
            CardSelectedView(card: $cardSelected, isShowing: $isCardSelected)
                .environmentObject(dashboardVM)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(isCardSelected: .constant(false))
    }
}
