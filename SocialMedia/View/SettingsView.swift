import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var loginViewModel: LoginViewModel // Usa o LoginViewModel do ambiente
    @State private var isNotificationsEnabled: Bool = true
    @State private var isDarkModeEnabled: Bool = false
    @State private var isPrivateAccount: Bool = false

    var body: some View {
        NavigationStack {
            List {
                // Account Settings Section
                Section(header: Text("Account Settings")) {
                    NavigationLink(destination: EditProfileView()) {
                        Label("Edit Profile", systemImage: "person.fill")
                    }
                    NavigationLink(destination: ChangePasswordView()) {
                        Label("Change Password", systemImage: "lock.fill")
                    }
                    NavigationLink(destination: LanguageView()) {
                        Label("Language", systemImage: "globe")
                    }
                }

                // Privacy Section
                Section(header: Text("Privacy")) {
                    Toggle(isOn: $isPrivateAccount) {
                        Label("Private Account", systemImage: "eye.slash.fill")
                    }
                    NavigationLink(destination: BlockedUsersView()) {
                        Label("Blocked Users", systemImage: "person.fill.xmark")
                    }
                }

                // Notifications Section
                Section(header: Text("Notifications")) {
                    Toggle(isOn: $isNotificationsEnabled) {
                        Label("Enable Notifications", systemImage: "bell.fill")
                    }
                    NavigationLink(destination: NotificationSettingsView()) {
                        Label("Notification Settings", systemImage: "gearshape.fill")
                    }
                }

                // Support Section
                Section(header: Text("Support")) {
                    NavigationLink(destination: HelpCenterView()) {
                        Label("Help Center", systemImage: "questionmark.circle.fill")
                    }
                    NavigationLink(destination: ContactSupportView()) {
                        Label("Contact Support", systemImage: "envelope.fill")
                    }
                    NavigationLink(destination: AboutView()) {
                        Label("About", systemImage: "info.circle.fill")
                    }
                }

                // Logout Section
                Section {
                    Button(action: {
                        loginViewModel.signOut() // Chama a função de logout
                    }) {
                        HStack {
                            Text("Log Out")
                            Image(systemName: "power")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .center) // Centraliza o texto e o ícone
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Placeholder views for navigation (you can replace these with actual implementations)
struct EditProfileView: View {
    var body: some View {
        Text("Edit Profile View")
            .navigationTitle("Edit Profile")
    }
}

struct ChangePasswordView: View {
    var body: some View {
        Text("Change Password View")
            .navigationTitle("Change Password")
    }
}

struct LanguageView: View {
    var body: some View {
        Text("Language View")
            .navigationTitle("Language")
    }
}

struct BlockedUsersView: View {
    var body: some View {
        Text("Blocked Users View")
            .navigationTitle("Blocked Users")
    }
}

struct NotificationSettingsView: View {
    var body: some View {
        Text("Notification Settings View")
            .navigationTitle("Notification Settings")
    }
}

struct HelpCenterView: View {
    var body: some View {
        Text("Help Center View")
            .navigationTitle("Help Center")
    }
}

struct ContactSupportView: View {
    var body: some View {
        Text("Contact Support View")
            .navigationTitle("Contact Support")
    }
}

struct AboutView: View {
    var body: some View {
        Text("About View")
            .navigationTitle("About")
    }
}

#Preview {
    SettingsView()
        .environmentObject(LoginViewModel()) // Adiciona o LoginViewModel ao preview
}
