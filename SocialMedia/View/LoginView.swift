//
//  LoginView.swift
//  SocialMedia
//
//  Created by Tsiory Rakotoarimanana on 2025-03-03.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack{
            VStack(spacing: 50){
                Spacer()
                Image(systemName: "square.and.arrow.up.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                VStack(spacing: 20){
                    TextField("Mobile or email address", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .padding(.horizontal,20)
                        .frame(width:.infinity , height:50)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius:10))
                        .padding()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textInputAutocapitalization(.never)
                        .padding(.horizontal,20)
                        .frame(width:.infinity , height:50)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius:10))
                        .padding()
                    
                    Button(action: {}, label: {
                        Text("Sign in")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width:200 , height:50)
                            .background(Color.gray.opacity(0.7))
                            .clipShape(RoundedRectangle(cornerRadius:10))
                    })
                    Text("Forgotten password?")
                        .fontWeight(.light)
                    
                }
            
                
                VStack{
                    Spacer()
                    Text("Don't have an account?")
                        .fontWeight(.light)
                    NavigationLink {
                        FillNameView()
                        
                    } label:{
                        Text("Sign up")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                   
                }
                Spacer()
            }.background(Color.blue)
        }
       
    }
}

#Preview {
    LoginView()
}
