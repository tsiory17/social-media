//
//  ContentView.swift
//  SocialMedia
//
//  Created by Tsiory Rakotoarimanana on 2025-03-03.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = LoginViewModel() // Share the model

    var body: some View {
 
            if viewModel.isLoggedIn, let currentUser = viewModel.currentUser {
                // Login TRUE
                HomeScreen(user: currentUser)
            } else {
                // Login FALSE
                LoginView(viewModel: viewModel)
            
        }
    }
}

#Preview {
    ContentView()
}
