//
//  SplashViewModel.swift
//  prototypeapp
//
//  Created by Senila Constantin on 14.03.2023.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("splashScreen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            //
            VStack(alignment: .center) {
                Text("FitPlan")
                    .cardTextStyle(font: Font.timesNewRomanBold35(), color: Color.white)
            }
        }
    }
}

struct SplashViewModel_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
