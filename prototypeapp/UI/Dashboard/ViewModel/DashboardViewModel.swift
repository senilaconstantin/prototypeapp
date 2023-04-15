//
//  DashboardViewModel.swift
//  prototypeapp
//
//  Created by Constantin Senila on 14.04.2023.
//

import SwiftUI

class DashboardViewModel: BaseViewModel {
    @Published var userDetails: UserDetails = .init(uuid: nil, firstName: "", lastName: "", sex: "", goal: "", weight: 0.0)
    
    override init() {
        super.init()
        DispatchQueue.main.async {
            self.reloadDetails()
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
}
