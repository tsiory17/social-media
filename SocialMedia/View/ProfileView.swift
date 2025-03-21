//
//  ProfileView.swift
//  SocialMedia
//
//  Created by Thiago Padilha on 2025-03-20.
//

import SwiftUI

struct ProfileView: View {
    let user: User

    var body: some View {
        VStack(spacing: 20) {
            // Circular profile picture
            Image(systemName: "person.circle.fill") // Placeholder for profile picture
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .foregroundColor(.blue) // Image color
                .background(Color.white) // White background to ensure visibility
                .clipShape(Circle()) // Makes the image circular
                .overlay(Circle().stroke(Color.blue, lineWidth: 4)) // Blue border around the image
                .shadow(radius: 10) // Shadow for a raised effect

            // User's name
            Text("\(user.firstName) \(user.lastName)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)

            // User information
            VStack(alignment: .leading, spacing: 10) {
                InfoRow(icon: "envelope.fill", text: user.email)
                InfoRow(icon: "calendar", text: "Age: \(user.age)")
            }
            .padding()
            .background(Color(.systemGray6)) // Light gray background
            .cornerRadius(10) // Rounded corners
            .padding(.horizontal)

            // Additional Information
            VStack(alignment: .leading, spacing: 15) {
                Text("Additional Information")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(.bottom, 5)

                InfoRow(icon: "house.fill", text: "Address: Not provided")
                InfoRow(icon: "phone.fill", text: "Phone: Not provided")
                InfoRow(icon: "briefcase.fill", text: "Occupation: Not provided")
                InfoRow(icon: "heart.fill", text: "Interests: Not provided")
            }
            .padding()
            .background(Color(.systemGray6)) // Light gray background
            .cornerRadius(10) // Rounded corners
            .padding(.horizontal)

            Spacer() // Pushes content to the top
        }
        .padding(.top, 40) // Top padding
        .navigationTitle("Profile") // Navigation title
        .navigationBarTitleDisplayMode(.inline) // Small title in the navigation bar
    }
}

// Reusable component to display icons and text
struct InfoRow: View {
    let icon: String
    let text: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 30)
            Text(text)
                .foregroundColor(.primary)
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView(user: User(id: "", firstName: "Duy", lastName: "Roan", age: 25, email: "duy@gmail.com", isCurrentUser: true, profileImage: "avatar 1"))
    }
}
