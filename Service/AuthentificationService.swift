//
//  AuthentificationService.swift
//  SocialMedia
//
//  Created by Tsiory Rakotoarimanana on 2025-03-03.
//
//need to change age to int but it is for testing
import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth
class AuthentificationService : ObservableObject {
    
    static let shared = AuthentificationService()
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    private func uploadUserData(firstName: String , lastName: String , age: Int , email: String , id: String, profileImage: String? = nil) async throws {
        let user = User(id: id, firstName: firstName, lastName: lastName, age: age, email: email, isCurrentUser: true, profileImage: profileImage)
        guard let userData = try? Firestore.Encoder().encode(user) else {return}
        
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        
    }
    
    @MainActor
    func createUser(email: String , password: String , firstName: String , lastName: String , age: Int) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(firstName: firstName, lastName: lastName, age: age, email: email, id: result.user.uid)
        } catch {
            print("User not created \(error.localizedDescription)")
            throw error // to be dealt on the caller
        }
        
    }
}
