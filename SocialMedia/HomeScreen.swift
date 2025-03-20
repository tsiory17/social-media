import SwiftUI

struct HomeScreen: View {
    let user: User // User logged

    var body: some View {
        ZStack {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        
                        // Header with user data
                        HStack {
                            Text("Welcome, \(user.firstName)!")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding()
                            Spacer()
                        }
                        
                        SearchBar()
                        Divider()
                        
                        StoryView(user: user)

                        RoundedRectangle(cornerRadius: 0)
                            .frame(width: 400, height: 10)
                            .foregroundColor(Color.gray.opacity(0.3))
                            .padding()
                    }
                }
            }
        }
    }
}

// ✅ Preview with Dummy data
#Preview {
    HomeScreen(user: User(id: "123", firstName: "John", lastName: "Doe", age: 25, email: "john@example.com", isCurrentUser: true))
}
