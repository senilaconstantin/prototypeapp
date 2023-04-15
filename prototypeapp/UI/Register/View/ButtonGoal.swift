//
//  ButtonGoal.swift
//  prototypeapp
//
//  Created by Constantin Senila on 14.04.2023.
//

import SwiftUI

struct ButtonGoal: View {
    var name: String = ""
    @Binding var goalType: GoalType
    
    var body: some View {
        VStack {
            Button {
                if name == GoalType.muscle.nameString() {
                    goalType = .muscle
                } else if name == GoalType.weakening.nameString() {
                    goalType = .weakening
                }
            } label: {
                ZStack {
                    Color.white
                    VStack {
                        Text(name)
                            .cardTextStyle(font: Font.verdan25(),
                                           color: Color.black.opacity(0.7))
                    }
//                    .padding([.leading, .trailing], 10)
                    .padding([.top, .bottom], 40)
                }
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(name == goalType.nameString() ? Color.green : Color.gray, lineWidth: 1)
                    .background(ZStack {
                        if name == goalType.nameString() {
                            Color.green.opacity(0.1)
                        } else {
                            Color.white.opacity(0)
                        }
                    }
                                
                               )
                )
            }
        }
    }
}

struct ButtonGoal_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGoal(name: GoalType.muscle.nameString(), goalType: .constant(.muscle))
    }
}
