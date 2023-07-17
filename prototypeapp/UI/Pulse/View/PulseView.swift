//
//  PulseView.swift
//  prototypeapp
//
//  Created by Constantin Senila on 03.05.2023.
//

import SwiftUI

struct PulseView: View {
    @StateObject var pulseVM: PulseViewModel = .init()
    @State var pulse: Float = 0.0
    
    @Binding var isPulse: Bool
    
    var body: some View {
        BaseView(viewModel: pulseVM) {
            GeometryReader { geometry in
                Image("registerScreen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text("Pulse Measurement")
                        .cardTextStyle(font: Font.verdanBold25(), color: Color.white)
                    Spacer()
                }
                
                Text("#INSTRUCTIONS: ")
                    .cardTextStyle(font: Font.verdanBold20(), color: Color.white)
                    .padding(.top, 20)
                
                
                Text("1. Prepare the pulse sensor")
                    .cardTextStyle(font: Font.verdan20(), color: Color.white)
                    .padding([.top, .leading], 10)
                Text("2. Put your finger on the pulse sensor")
                    .cardTextStyle(font: Font.verdan20(), color: Color.white)
                    .padding([.top, .leading], 10)
                Text("3. Press the Start button")
                    .cardTextStyle(font: Font.verdan20(), color: Color.white)
                    .padding([.top, .leading], 10)
                Text("4. Wait 5-10 seconds for the result")
                    .cardTextStyle(font: Font.verdan20(), color: Color.white)
                    .padding([.top, .leading], 10)
                
                Spacer()
                
                Button {
                    pulseVM.showLoading = true
                    APIClient.shared.checkPulseData(token: CurrentUser.shared.getToken()) { pulse in
                        pulseVM.showLoading = false
                        if let pulse = pulse {
                            self.isPulse = true
                            self.pulse = pulse.pulse
                        } else {
                            print("---nimic bun")
                        }
                    }
                } label: {
                    HStack {
                        Spacer()
                        Text("Start")
                            .cardTextStyle(font: Font.verdan20(), color: Color.white)
                        Spacer()
                    }
                    .padding([.top, .bottom], 20)
                    .background(Color.black)
                    .cornerRadius(30)
                }
                
                Spacer()
            }
            .padding([.leading, .trailing], 20)
            .padding([.top, .bottom], 20)
            
            PulseResultView(isPulse: $isPulse, pulse: $pulse)
                .environmentObject(pulseVM)
        }
    }
}

//struct PulseView_Previews: PreviewProvider {
//    static var previews: some View {
//        PulseView()
//    }
//}
