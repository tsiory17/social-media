//
//  LoginViewModel.swift
//  SocialMedia
//
//  Created by Tsiory Rakotoarimanana on 2025-03-03.
//

import FirebaseAuth
import FirebaseFirestore

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoggedIn = false
    @Published var errorMessage: String?
    @Published var currentUser: User?
    @Published var isLoading = false
    
    // Logout func
    func signOut() {
        do {
            try Auth.auth().signOut() // Perform Logout
            isLoggedIn = false // Update Login
            currentUser = nil // Remove user
            clearFields() // Clear the fields
        } catch {
            errorMessage = "Failed to sign out: \(error.localizedDescription)"
        }
    }
    
    // Func to clear fields on Logout
        func clearFields() {
            email = ""
            password = ""
        }

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
                        isCurrentUser: true,
                        profileImage: "avatar 1"
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
