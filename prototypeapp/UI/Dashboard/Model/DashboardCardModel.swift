//
//  DashboardCardModel.swift
//  prototypeapp
//
//  Created by Constantin Senila on 15.05.2023.
//

import SwiftUI

public class DashboardCardModel: Codable, ObservableObject {
    public var uuid: String?
    public var cardType: String?
    public var name: String?
    public var description: String?
    public var date: String?
    public var statusType: String?
    
    public init(uuid: String?, cardType: String?, name: String?, description: String?, date: String?, statusType:  String?) {
        self.uuid = uuid
        self.cardType = cardType
        self.name = name
        self.description = description
        self.date = date
        self.statusType = statusType
    }
}
