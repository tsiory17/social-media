//
//  LoginView.swift
//  SocialMedia
//
//  Created by Tsiory Rakotoarimanana on 2025-03-03.
//

import SwiftUI

//struct LoginView: View {
//    @ObservedObject var viewModel: LoginViewModel // To use the ViewModel
//    @EnvironmentObject private var loginViewModel: FillNameViewModel
//    
//    var body: some View {
//        NavigationStack {
//            VStack(spacing: 50) {
//                Spacer()
//                Image(systemName: "square.and.arrow.up.circle.fill")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 100, height: 100)
//                
//                VStack(spacing: 20) {
//                    TextField("Mobile or email address", text: $viewModel.email)
//                        .textInputAutocapitalization(.never)
//                        .padding(.horizontal, 20)
//                        .frame(height: 50)
//                        .background(Color.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .padding()
//                    
//                    SecureField("Password", text: $viewModel.password)
//                        .textInputAutocapitalization(.never)
//                        .padding(.horizontal, 20)
//                        .frame(height: 50)
//                        .background(Color.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .padding()
//                    
//                    // Exibir mensagem de erro, se houver
//                    if let errorMessage = viewModel.errorMessage {
//                        Text(errorMessage)
//                            .foregroundColor(.red)
//                            .font(.subheadline)
//                            .padding()
//                    }
//                    
//                    Button(action: {
//                        Task {
//                            await viewModel.login()
//                        }
//                    }, label: {
//                        if viewModel.isLoading {
//                            ProgressView()
//                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
//                        } else {
//                            Text("Sign in")
//                                .font(.headline)
//                                .fontWeight(.bold)
//                                .foregroundColor(.white)
//                                .frame(width: 200, height: 50)
//                                .background(Color.gray.opacity(0.7))
//                                .clipShape(RoundedRectangle(cornerRadius: 10))
//                        }
//                    })
//                    
//                    Text("Forgotten password?")
//                        .fontWeight(.light)
//                }
//                
//                VStack {
//                    Spacer()
//                    Text("Don't have an account?")
//                        .fontWeight(.light)
//                    NavigationLink {
//                        FillNameView()
//                    } label: {
//                        Text("Sign up")
//                            .fontWeight(.semibold)
//                            .foregroundColor(.black)
//                    }
//                }
//                Spacer()
//            }
//            .background(Color.blue)
//        }
//    }
//}

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel // To use the ViewModel
    @EnvironmentObject private var fillNameViewModel: FillNameViewModel // FillNameViewModel do ambiente

    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                Spacer()
                Image(systemName: "square.and.arrow.up.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                
                VStack(spacing: 20) {
                    TextField("Mobile or email address", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .padding(.horizontal, 20)
                        .frame(height: 50)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textInputAutocapitalization(.never)
                        .padding(.horizontal, 20)
                        .frame(height: 50)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                    
                    // Exibir mensagem de erro, se houver
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.subheadline)
                            .padding()
                    }
                    
                    Button(action: {
                        Task {
                            await viewModel.login()
                        }
                    }, label: {
                        if viewModel.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else {
                            Text("Sign in")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50)
                                .background(Color.gray.opacity(0.7))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    })
                    
                    Text("Forgotten password?")
                        .fontWeight(.light)
                }
                
                VStack {
                    Spacer()
                    Text("Don't have an account?")
                        .fontWeight(.light)
                    NavigationLink {
                        FillNameView()
                            .environmentObject(fillNameViewModel) // Passa o FillNameViewModel para o FillNameView
                    } label: {
                        Text("Sign up")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                }
                Spacer()
            }
            .background(Color.blue)
        }
    }
}

