//
//  BaseView.swift
//  prototypeapp
//
//  Created by Senila Constantin on 19.03.2023.
//

import SwiftUI

struct BaseView<Content, ViewModel: BaseViewModel>: View where Content: View {
    public let bgImage = Color.white
    public let content: Content
    public var viewModel: ViewModel
    
    // MARK: - Init
    public init(viewModel: ViewModel, @ViewBuilder content: () -> Content) {
        self.viewModel = viewModel
        self.content = content()
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            bgImage
            content
            if viewModel.showLoading {
                loadingView
            }
        }
        .alert(isPresented: .constant(viewModel.errorMessage != nil)) {
            Alert(title: Text("Error!"), message: Text(viewModel.errorMessage ?? ""), dismissButton: .default(Text("OK")))
        }
    }
    
    // MARK: - Private
    private var loadingView: some View {
        ZStack {
            //            LoadingView()
            //                .edgesIgnoringSafeArea(.all)
        }
    }
}
