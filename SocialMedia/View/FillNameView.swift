//
//  FillNameView.swift
//  SocialMedia
//
//  Created by Tsiory Rakotoarimanana on 2025-03-03.
//

import SwiftUI

struct FillNameView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = FillNameViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue // Set background directly in ZStack
                    .ignoresSafeArea() // Ensures full-screen background
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        VStack(spacing:10) {
                            Text("Welcome to our Registration Page:")
                                .font(.system(size: 22, weight: .bold, design: .default))
                            Text("We would like to know more about you:")
                                .font(.system(size: 19, weight: .semibold, design: .default))
                            Text("Please make sure that the information you provide us is accurate")
                                .font(.system(size: 14, weight: .light, design: .default))
                                .foregroundStyle(.black.opacity(0.4))
                        }
                        .padding()
                        //Name
                        
                        VStack (alignment: .leading){
                            Text("Name")
                            
                            HStack(spacing: 30) {
                                TextField("First Name", text: $viewModel.firstName)
                                    .textInputAutocapitalization(.never)
                                    .padding(.horizontal, 20)
                                    .frame(width: 170, height: 50)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                TextField("Last Name", text: $viewModel.lastName)
                                    .textInputAutocapitalization(.never)
                                    .padding(.horizontal, 20)
                                    .frame(width: 170, height: 50)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            
                        }.padding()
                        
                        //Age
                        
                        
                        VStack (alignment: .leading){
                            Text("Age")
                            HStack(spacing: 30) {
                                TextField("Age", text: $viewModel.age)
                                    .textInputAutocapitalization(.never)
                                    .padding(.horizontal, 20)
                                    .frame(width: 170, height: 50)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }.padding()
                        
                        //email
                        VStack (alignment: .leading){
                            Text("Email:")
                            HStack(spacing: 30) {
                                TextField("Email Address", text: $viewModel.email)
                                    .textInputAutocapitalization(.never)
                                    .padding(.horizontal, 20)
                                    .frame(width: 370, height: 50)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }.padding()
                    }
                        //password
                        VStack (alignment: .leading){
                            Text("Password:")
                            HStack(spacing: 30) {
                                SecureField("Password", text: $viewModel.password)
                                    .textInputAutocapitalization(.never)
                                    .padding(.horizontal, 20)
                                    .frame(width: 370, height: 50)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        }.padding()
                        }
                        Spacer()
                            .frame(height: 20)
                        VStack {
                         Button {
                             Task{
                                 do {
                                        try await viewModel.createUser()
                                    } catch {
                                        print("Failed to create user: \(error.localizedDescription)")
                                    }
                             }
                            } label: {
                                Text("Register")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .frame(width: 300, height: 50)
                                    .background(.gray)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        .padding(20)
                        VStack {
                            NavigationLink {
                                LoginView(viewModel: LoginViewModel())
                            } label: {
                                Text("Have an account already?")
                                    .fontWeight(.light)
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                        
                                 
                                 
                            }
                        }
                       
                    }
                    .padding()
                
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
}
