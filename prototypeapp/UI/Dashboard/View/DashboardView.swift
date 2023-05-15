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
    @State private var isCardSelected = false
    
    var body: some View {
        BaseView(viewModel: dashboardVM) {
            GeometryReader { geometry in
                Image("dashboardScreen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
//                        .offset(y: -50)
            VStack(spacing: 20) {
                Spacer()
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
                        }
                    }
                }
                .padding([.top], 40)
            }
            .padding([.top], 20)
            .padding([.bottom], 1)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
