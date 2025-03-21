//
//  ContentView.swift
//  SocialMedia
//
//  Created by Tsiory Rakotoarimanana on 2025-03-03.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var viewModel = LoginViewModel()
    @StateObject private var fillNameViewModel = FillNameViewModel() //  FillNameViewModel instance
    @State private var selectedTab = 0

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoggedIn, let currentUser = viewModel.currentUser {
                    // If user Logged, display Tabview
                    TabView(selection: $selectedTab) {
                        // Aba 1: HomeScreen
                        HomeScreen(user: currentUser)
                            .tabItem {
                                Image(systemName: "house.fill")
                                Text("Home")
                            }
                            .tag(0)
                        
                        StoryView()
                            .tabItem {
                                Image(systemName: "photo.fill.on.rectangle.fill")
                                Text("Story")
                            }
                            .tag(1)

                        // Aba 2: ProfileView
                        ProfileView(user: currentUser)
                            .tabItem {
                                Image(systemName: "person.fill")
                                Text("Profile")
                            }
                            .tag(2)

                        // Aba 3: SettingsView
                        SettingsView()
                            .tabItem {
                                Image(systemName: "gearshape.fill")
                                Text("Settings")
                            }
                            .tag(3)
                    }
                    .accentColor(.blue)
                    .environmentObject(viewModel) // Pass LoginViewModel view of  TabView
                } else {
                    // Otherwise display Login
                    LoginView(viewModel: viewModel)
                        .environmentObject(fillNameViewModel) // Injeta o FillNameViewModel no ambiente
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(LoginViewModel())
        .environmentObject(FillNameViewModel())
}
