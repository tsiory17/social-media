//
//  LoginViewModel.swift
//  SocialMedia
//
//  Created by Tsiory Rakotoarimanana on 2025-03-03.
//

import FirebaseAuth
import FirebaseFirestore

import FirebaseAuth
import FirebaseFirestore

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoggedIn = false
    @Published var errorMessage: String?
    @Published var currentUser: User?
    @Published var isLoading = false

    func login() async {
        isLoading = true
        errorMessage = nil // Clean error message before login
        defer { isLoading = false }
        
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            let uid = result.user.uid

            // Search user on FIrestore
            let doc = try await Firestore.firestore().collection("users").document(uid).getDocument()
            if let data = doc.data() {
                await MainActor.run {
                    currentUser = User(
                        id: uid,
                        firstName: data["firstName"] as? String ?? "Unknown",
                        lastName: data["lastName"] as? String ?? "",
                        age: data["age"] as? Int ?? 0,
                        email: data["email"] as? String ?? "",
                        isCurrentUser: true
                    )
                    isLoggedIn = true // To navigate after login
                }
            }
        } catch {
            await MainActor.run {
                errorMessage = "Login or password is incorrect. Please try again."
            }
        }
    }
}
