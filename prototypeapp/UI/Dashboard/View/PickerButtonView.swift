//
//  PickerButtonView.swift
//  prototypeapp
//
//  Created by Constantin Senila on 16.05.2023.
//

import SwiftUI

struct PickerButtonView: View {
    @Binding var selected: String
    var options: [String]
    var textSTring: String
    
    
    
    var body: some View {
        HStack {
            Text(textSTring)
                .cardTextStyle(font: Font.verdan15(), color: Color.black)
            Picker("Opțiuni", selection: $selected) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                        .cardTextStyle(font: Font.verdan20(), color: Color.black)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .onChange(of: selected) { _ in
                // Feedback haptic
                let feedbackGenerator = UISelectionFeedbackGenerator()
                feedbackGenerator.selectionChanged()
            }
            .frame(height: 120)
        }
    }
}

//struct PickerButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        PickerButtonView(options: ["Opțiunea 1", "Opțiunea 2", "Opțiunea 3", "Opțiunea 4", "Opțiunea 5"], textSTring: "ceva")
//    }
//}
