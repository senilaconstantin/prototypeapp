//
//  SuccesResponse.swift
//  prototypeapp
//
//  Created by Constantin Senila on 15.05.2023.
//

import Foundation

public struct SuccessResponse: Codable {
    public var successful: Bool?

    public init(successful: Bool?) {
        self.successful = successful
    }
}
