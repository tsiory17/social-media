//
//  FillNameViewModel.swift
//  SocialMedia
//
//  Created by Tsiory Rakotoarimanana on 2025-03-03.
//

import Foundation
class FillNameViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var age: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @MainActor
    func createUser() async throws {
        if let age = Int(age){
            try await AuthentificationService.shared.createUser(email: email , password: password , firstName: firstName , lastName: lastName , age: age)
        }else {
            try await AuthentificationService.shared.createUser(email: email , password: password , firstName: firstName , lastName: lastName , age: 0)

        }
    }

    
}

