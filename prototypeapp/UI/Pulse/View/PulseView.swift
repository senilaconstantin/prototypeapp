//
//  PulseView.swift
//  prototypeapp
//
//  Created by Constantin Senila on 03.05.2023.
//

import SwiftUI

struct PulseView: View {
    @State var txt: String = ""
    @StateObject var pulseVM: PulseViewModel = .init()
    var body: some View {
        BaseView(viewModel: pulseVM) {
            Color.gray
            VStack {
                Text(txt)
                Button{
                    APIClient.shared.checkPulseData(token: CurrentUser.shared.getToken()) { pulse in
                        if let pulse = pulse {
                            self.txt = "------ \(pulse.pulse) ------"
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
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct PulseView_Previews: PreviewProvider {
    static var previews: some View {
        PulseView()
    }
}
