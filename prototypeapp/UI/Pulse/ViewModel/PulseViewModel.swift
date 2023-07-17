//
//  PulseViewModel.swift
//  prototypeapp
//
//  Created by Constantin Senila on 14.05.2023.
//

import SwiftUI

class PulseViewModel: BaseViewModel {
    
    func setCardPulse(pulse: Float) {
        showLoading = true
        let card: DashboardCardModelPost = .init(uuid: "",
                                                 cardType: "HEALTH",
                                                 name: "",
                                                 description: "",
                                                 date: Date.convertStringFromDate(date: Date.getCurrentDate()),
                                                 statusType: "TODO")
        if pulse > AppConstants.Pulse.highPulseOk {
            card.name = "High pulse"
            card.description = "Your pulse was \(String(format: "%.1f", pulse))\n- Stop and relax \n- Cool your body \n- Hydrate yourself"
            
        } else if pulse < AppConstants.Pulse.smallPulseOk {
            card.name = "Small pulse"
            card.description = "Your pulse was \(String(format: "%.1f", pulse))\n- Consult a doctor \n- Avoid stress factors \n- Eat nutritious food"
        }
        
        APIClient.shared.addCard(token: CurrentUser.shared.getToken(), card: card) { error in
            DispatchQueue.main.async {
                if let _ = error {
                    self.errorMessage = "The card could not be added!"
                }
            }
            self.showLoading = false
        }
    }
    
}
