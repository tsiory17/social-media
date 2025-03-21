////
////  FillNameView.swift
////  SocialMedia
////
////  Created by Tsiory Rakotoarimanana on 2025-03-03.
////
//
//import SwiftUI
//
//struct FillNameView: View {
//    @Environment(\.dismiss) private var dismiss
//    @StateObject private var viewModel = FillNameViewModel()
//    @EnvironmentObject private var loginViewModel: LoginViewModel 
//
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Color.blue
//                    .ignoresSafeArea()
//                
//                ScrollView(.vertical, showsIndicators: false) {
//                    VStack(alignment: .leading, spacing: 20) {
//                        // Header
//                        VStack(spacing: 10) {
//                            Text("Welcome to our Registration Page:")
//                                .font(.system(size: 22, weight: .bold, design: .default))
//                            Text("We would like to know more about you:")
//                                .font(.system(size: 19, weight: .semibold, design: .default))
//                            Text("Please make sure that the information you provide us is accurate")
//                                .font(.system(size: 14, weight: .light, design: .default))
//                                .foregroundStyle(.black.opacity(0.4))
//                        }
//                        .padding(.horizontal)
//                        
//                        // Name
//                        VStack(alignment: .leading, spacing: 10) {
//                            Text("Name")
//                            HStack(spacing: 30) {
//                                TextField("First Name", text: $viewModel.firstName)
//                                    .textInputAutocapitalization(.never)
//                                    .padding(.horizontal, 20)
//                                    .frame(height: 50)
//                                    .background(.white)
//                                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                                
//                                TextField("Last Name", text: $viewModel.lastName)
//                                    .textInputAutocapitalization(.never)
//                                    .padding(.horizontal, 20)
//                                    .frame(height: 50)
//                                    .background(.white)
//                                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                            }
//                        }
//                        .padding(.horizontal)
//                        
//                        // Age
//                        VStack(alignment: .leading, spacing: 10) {
//                            Text("Age")
//                            TextField("Age", text: $viewModel.age)
//                                .textInputAutocapitalization(.never)
//                                .padding(.horizontal, 20)
//                                .frame(width: 120, height: 50, alignment: .leading)
//                                .background(.white)
//                                .clipShape(RoundedRectangle(cornerRadius: 10))
//                        }
//                        .padding(.horizontal)
//                        
//                        // Email
//                        VStack(alignment: .leading, spacing: 10) {
//                            Text("Email:")
//                            TextField("Email Address", text: $viewModel.email)
//                                .textInputAutocapitalization(.never)
//                                .padding(.horizontal, 20)
//                                .frame(height: 50)
//                                .background(.white)
//                                .clipShape(RoundedRectangle(cornerRadius: 10))
//                        }
//                        .padding(.horizontal)
//                        
//                        // Password
//                        VStack(alignment: .leading, spacing: 10) {
//                            Text("Password:")
//                            SecureField("Password", text: $viewModel.password)
//                                .textInputAutocapitalization(.never)
//                                .padding(.horizontal, 20)
//                                .frame(height: 50)
//                                .background(.white)
//                                .clipShape(RoundedRectangle(cornerRadius: 10))
//                        }
//                        .padding(.horizontal)
//                        
//                        // Register Button
//                        Button {
//                            Task {
//                                do {
//                                    try await viewModel.createUser()
//                                } catch {
//                                    print("Failed to create user: \(error.localizedDescription)")
//                                }
//                            }
//                        } label: {
//                            if viewModel.isLoading {
//                                ProgressView()
//                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
//                                    .frame(maxWidth: .infinity, minHeight: 50)
//                            } else {
//                                Text("Register")
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(.black)
//                                    .frame(maxWidth: .infinity, minHeight: 50)
//                                    .background(.gray)
//                                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                            }
//                        }
//                        .padding(.horizontal)
//                        
//                        // Success message
//                        if let message = viewModel.message {
//                            Text(message)
//                                .font(.subheadline)
//                                .foregroundColor(viewModel.isSuccess ? .green : .red)
//                                .padding(.horizontal)
//                        }
//                        
//                        // Link to login
//                        NavigationLink {
//                            LoginView(viewModel: loginViewModel) // Usa o LoginViewModel do ambiente
//                        } label: {
//                            HStack {
//                                Text("Have an account already?")
//                                Text("Click Here!")
//                                    .fontWeight(.bold)
//                            }
//                            .fontWeight(.light)
//                            .font(.subheadline)
//                            .foregroundColor(.black)
//                        }
//                        .padding(.horizontal)
//                    }
//                    .padding(.vertical, 20)
//                }
//            }
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Image(systemName: "chevron.left")
//                        .imageScale(.large)
//                        .onTapGesture {
//                            dismiss()
//                        }
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    FillNameView()
//        .environmentObject(LoginViewModel()) // Adiciona o LoginViewModel ao preview
//}
//


import SwiftUI

struct FillNameView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var viewModel: FillNameViewModel // Usa o FillNameViewModel do ambiente
    @EnvironmentObject private var loginViewModel: LoginViewModel // Usa o LoginViewModel do ambiente

    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        // Header
                        VStack(spacing: 10) {
                            Text("Welcome to our Registration Page:")
                                .font(.system(size: 22, weight: .bold, design: .default))
                            Text("We would like to know more about you:")
                                .font(.system(size: 19, weight: .semibold, design: .default))
                            Text("Please make sure that the information you provide us is accurate")
                                .font(.system(size: 14, weight: .light, design: .default))
                                .foregroundStyle(.black.opacity(0.4))
                        }
                        .padding(.horizontal)
                        
                        // Name
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Name")
                            HStack(spacing: 30) {
                                TextField("First Name", text: $viewModel.firstName)
                                    .textInputAutocapitalization(.never)
                                    .padding(.horizontal, 20)
                                    .frame(height: 50)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                TextField("Last Name", text: $viewModel.lastName)
                                    .textInputAutocapitalization(.never)
                                    .padding(.horizontal, 20)
                                    .frame(height: 50)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        .padding(.horizontal)
                        
                        // Age
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Age")
                            TextField("Age", text: $viewModel.age)
                                .textInputAutocapitalization(.never)
                                .padding(.horizontal, 20)
                                .frame(width: 120, height: 50, alignment: .leading)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .padding(.horizontal)
                        
                        // Email
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Email:")
                            TextField("Email Address", text: $viewModel.email)
                                .textInputAutocapitalization(.never)
                                .padding(.horizontal, 20)
                                .frame(height: 50)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .padding(.horizontal)
                        
                        // Password
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Password:")
                            SecureField("Password", text: $viewModel.password)
                                .textInputAutocapitalization(.never)
                                .padding(.horizontal, 20)
                                .frame(height: 50)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .padding(.horizontal)
                        
                        // Register Button
                        Button {
                            Task {
                                do {
                                    try await viewModel.createUser()
                                } catch {
                                    print("Failed to create user: \(error.localizedDescription)")
                                }
                            }
                        } label: {
                            if viewModel.isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                    .frame(maxWidth: .infinity, minHeight: 50)
                            } else {
                                Text("Register")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, minHeight: 50)
                                    .background(.gray)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        .padding(.horizontal)
                        
                        // Success message
                        if let message = viewModel.message {
                            Text(message)
                                .font(.subheadline)
                                .foregroundColor(viewModel.isSuccess ? .green : .red)
                                .padding(.horizontal)
                        }
                        
                        // Link to login
                        NavigationLink {
                            LoginView(viewModel: loginViewModel)
                        } label: {
                            HStack {
                                Text("Have an account already?")
                                Text("Click Here!")
                                    .fontWeight(.bold)
                            }
                            .fontWeight(.light)
                            .font(.subheadline)
                            .foregroundColor(.black)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical, 20)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
    }
}

#Preview {
    FillNameView()
        .environmentObject(LoginViewModel()) // Adiciona o LoginViewModel ao preview
        .environmentObject(FillNameViewModel()) // Adiciona o FillNameViewModel ao preview
}
