////
////  FillNameViewModel.swift
////  SocialMedia
////
////  Created by Tsiory Rakotoarimanana on 2025-03-03.
////
//

import FirebaseAuth
import FirebaseFirestore

class FillNameViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var age: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var isLoading: Bool = false
    @Published var message: String? = nil
    @Published var isSuccess: Bool = false

    @MainActor
    func createUser() async {
        isLoading = true
        message = nil
        defer { isLoading = false }
        
        do {
            // Execute user creation ins  secondary thread
            try await Task.detached {
                if let age = Int(self.age) {
                    try await AuthentificationService.shared.createUser(
                        email: self.email,
                        password: self.password,
                        firstName: self.firstName,
                        lastName: self.lastName,
                        age: age
                    )
                } else {
                    try await AuthentificationService.shared.createUser(
                        email: self.email,
                        password: self.password,
                        firstName: self.firstName,
                        lastName: self.lastName,
                        age: 0
                    )
                }
            }.value
            
            // Success
            message = "Registration successful!"
            isSuccess = true
        } catch let error as NSError {
            // Email already in use
            if error.code == AuthErrorCode.emailAlreadyInUse.rawValue {
                message = "Email already in use. Please use a different email."
                isSuccess = false
            } else {
                // General erros
                message = "Failed to register: \(error.localizedDescription)"
                isSuccess = false
            }
        }
    }
}
