//
//  BaseViewModel.swift
//  prototypeapp
//
//  Created by Senila Constantin on 19.03.2023.
//

import SwiftUI
import Combine

class BaseViewModel: ObservableObject {
    @Published var errorMessage: String? = nil
    @Published var showLoading: Bool = false
    
    func resetErrorMessage() {
        errorMessage = nil
    }
}
