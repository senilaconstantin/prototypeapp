//
//  DashboardViewModel.swift
//  prototypeapp
//
//  Created by Constantin Senila on 14.04.2023.
//

import SwiftUI

class DashboardViewModel: BaseViewModel {
    @Published var userDetails: UserDetails = .init(uuid: nil, firstName: "", lastName: "", sex: "", goal: "", weight: 0.0)
    @Published var listCard: [DashboardCardModelPost] = [DashboardCardModelPost]()
    
    override init() {
        super.init()
        DispatchQueue.main.async {
            self.reloadDetails()
            self.reloadCards()
        }
    }
    
    func reloadCards() {
//        showLoading = true
        listCard = []
        APIClient.shared.getDashboardsCardsData(token: CurrentUser.shared.getToken()) { data in
            DispatchQueue.main.async {
                if let cards = data {
                    cards.forEach { card in
                        let cardDashboard = DashboardCardModelPost.init(card: card)
                        self.listCard.append(cardDashboard)
                    }
                }
                self.showLoading = false
            }
            
        }
    }
    
    func reloadDetails() {
        APIClient.shared.getUserDetailsData(token: CurrentUser.shared.getToken()) { data in
            DispatchQueue.main.async {
                if let userDetails = data {
                    self.userDetails = userDetails
                    print("------")
                    print(userDetails.uuid ?? "")
                    print(self.userDetails.firstName)
                    print(userDetails.lastName)
                    //                    self.userDetails.uuid = userDetails.uuid
                    //                    self.userDetails.firstName = userDetails.firstName
                    //                    self.userDetails.lastName = userDetails.lastName
                } else {
                    print("nu e userDetails")
                }
            }
        }
        
        ////
        //        HealthDataRead.shared.requestAuthorization()
        //
        //        HealthDataRead.shared.getCaloriesBurned { calories in
        //            print("---\(calories)")
        //        }
        //        HealthDataRead.shared.getDistanceWalkingRunning()
        //        HealthDataRead.shared.readRestingEnergy()
        //        HealthDataRead.shared.readSteps()
        
        ////
    }
    
    func updateCard(card: DashboardCardModelPost) {
        showLoading = true
        APIClient.shared.updateCard(token: CurrentUser.shared.getToken(), card: card) { error in
            DispatchQueue.main.async {
                if let _ = error {
                    self.errorMessage = "The card could not be updated!"
                }
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.reloadCards()
//                }
            }
            
        }
    }
}
