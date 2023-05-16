//
//  CardView.swift
//  prototypeapp
//
//  Created by Constantin Senila on 15.05.2023.
//

import SwiftUI

struct CardView: View {
    @Binding var card: DashboardCardModelPost
    
    var body: some View {
        ZStack {
            HStack(spacing: 10) {
                Image(systemName: card.cardType == .food ? "fork.knife.circle" : card.cardType == .health ? "bolt.heart.fill" : "figure.run")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .scaledToFit()
                    .foregroundColor(Color.white)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(card.name)
                        .cardTextStyle(font: Font.verdanBold20(), color: Color.white)
                    
                    Text("\(card.description)")
                        .cardTextStyle(font: Font.verdan15(), color: Color.white)
                }
                .padding([.top, .bottom])
                .padding([.trailing], 10)
                
                Spacer()
                
            }
            .padding([.leading, .trailing])
        }
        .background(card.statusType == .Done ? Color.green.cornerRadius(15) : Color.colorToDoCard.cornerRadius(15))
//        .padding([.leading, .trailing], 20)
        //        .cornerRadius(15)
        
    }
}


//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
