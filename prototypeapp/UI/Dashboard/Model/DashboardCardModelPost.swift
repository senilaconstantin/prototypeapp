//
//  DashboardCardModelPost.swift
//  prototypeapp
//
//  Created by Constantin Senila on 15.05.2023.
//

import SwiftUI

public class DashboardCardModelPost: ObservableObject {
    public var uuid: String
    public var cardType: CardType
    public var name: String
    public var description: String
    public var date: Date
    public var statusType: StatusType
    
    public init(card: DashboardCardModel) {
        self.uuid = card.uuid ?? ""
        self.cardType = CardType.caseForString(card.cardType ?? "")
        self.name = card.name ?? ""
        self.description = card.description ?? ""
        self.date = Date.convertDateFromString(date: card.date ?? "")
        self.statusType = StatusType.caseForString(card.statusType ?? "")
    }
    
    public init(uuid: String, cardType: String, name: String, description: String, date: String, statusType:  String) {
        self.uuid = uuid
        self.cardType = CardType.caseForString(cardType)
        self.name = name
        self.description = description
        self.date = Date.convertDateFromString(date: date)
        self.statusType = StatusType.caseForString(statusType)
    }
}

