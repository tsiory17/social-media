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
                    VStack(spacing: 16) {
                        Text("Welcome, \(user.firstName)!")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top, 20)

                        PostView(currentUser: user)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 20)
                }
                
                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
}

//Dummy data
#Preview {
    HomeScreen(user: User(id: "", firstName: "Duy", lastName: "Roan", age: 25, email: "duy@gmail.com", isCurrentUser: true, profileImage: "avatar 1"))
        .environmentObject(LoginViewModel()) // Add LoginViewModel to preview
}
