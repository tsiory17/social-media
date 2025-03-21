import SwiftUI

struct HomeScreen: View {
    let user: User // User Logged
    @EnvironmentObject var loginViewModel: LoginViewModel // Use LoginViewModel

    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                // Header
                HStack {
                    Text("Welcome, \(user.firstName)!")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    Spacer()
                    
//                    // Logout Button
//                    Button(action: {
//                        loginViewModel.signOut() // Call Logout
//                    }) {
//                        HStack{
//                            Text("Log Out")
//                            Image(systemName: "power")
//                                .fontWeight(.bold)
//                        }
//                            .font(.system(size: 20))
//                            .foregroundColor(.red)
//                            .padding(.trailing)
//                    }
                }
                .padding(.vertical, 10)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                
                //  Main Content
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        SearchBar()
                        Divider()
                        
                        StoryView(user: user)

                        RoundedRectangle(cornerRadius: 0)
                            .frame(height: 10)
                            .foregroundColor(Color.gray.opacity(0.3))
                            .padding(.vertical)
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

//Dummy data
#Preview {
    HomeScreen(user: User(id: "123", firstName: "John", lastName: "Doe", age: 25, email: "john@example.com", isCurrentUser: true))
        .environmentObject(LoginViewModel()) // Add LoginViewModel to preview
}
