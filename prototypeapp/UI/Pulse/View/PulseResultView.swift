//
//  PulseResultView.swift
//  prototypeapp
//
//  Created by Constantin Senila on 17.05.2023.
//

import SwiftUI

struct PulseResultView: View {
    @EnvironmentObject var pulseVM: PulseViewModel
    
    @Binding var isPulse: Bool
    @Binding var pulse: Float
    
    var body: some View {
        ZStack {
            if isPulse {
                BackdropView()
                    .blur(radius: 5.0)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    
                    mainView
                        .transition(.move(edge: .bottom))
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 3)
                .background(Color.white)
                .cornerRadius(20)
                .padding([.leading, .trailing], 10)
                .shadow(radius: 5)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var mainView: some View {
        VStack (alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
                Text("The result of the pulse")
                    .cardTextStyle(font: Font.verdanBold20(), color: Color.black)
                Spacer()
            }
            Spacer()

            Text("Your pulse is: \(String(format: "%.1f", pulse))")
                .cardTextStyle(font: Font.verdan20(), color: Color.black)
            HStack {
                Text("Your pulse is ")
                    .cardTextStyle(font: Font.verdan20(), color: Color.black)
                Text(pulse < AppConstants.Pulse.smallPulseOk ? "low!" : pulse > AppConstants.Pulse.highPulseOk ? "high!" : "OK!")
                    .cardTextStyle(font: Font.verdanBold20(), color: Color.black)
            }

            Spacer()

            HStack(spacing: 20) {
                Button {
                    isPulse = false
                } label: {
                    HStack{
                        Spacer()
                        Text("Ok")
                            .foregroundColor(.white)
                            .padding()

                        Spacer()
                    }
                    .background(Color.blue)
                    .cornerRadius(20)
                }

                Button {
                    isPulse = false
                    pulseVM.setCardPulse(pulse: pulse)
                    
                } label: {
                    HStack{
                        Spacer()
                        Text("Set Card")
                            .foregroundColor(.white)
                            .padding()

                        Spacer()
                    }
                    .background((pulse >= AppConstants.Pulse.smallPulseOk && pulse <= AppConstants.Pulse.highPulseOk) ? Color.gray : Color.blue)
                    .cornerRadius(20)
                }
                .disabled((pulse >= AppConstants.Pulse.smallPulseOk && pulse <= AppConstants.Pulse.highPulseOk) ? true : false)
            }
        }
        .padding(20)
    
        
    }
}

struct PulseResultView_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var pulseVM: PulseViewModel = .init()
        PulseResultView(isPulse: .constant(true), pulse: .constant(55))
            .environmentObject(pulseVM)
    }
}
