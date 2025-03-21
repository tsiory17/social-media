//
//  UploadStoryView.swift
//  SocialMedia
//
//  Created by Duizzz on 20/3/25.
//

import SwiftUI
import PhotosUI

struct UploadStoryView: View {
    @State private var showingImagePicker = false
    @State private var selectedImage: UIImage?
    @StateObject var storyManager = FirestoreStoryManager()

    // Dummy user (replace with actual user management)
    let user = User(id: "123", firstName: "Duy", lastName: "Roan", age: 25, email: "duy@gmail.com", isCurrentUser: true, profileImage: "avatar 1")

    var body: some View {
        NavigationView {
            VStack {
                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .onTapGesture {
                            showingImagePicker = true
                        }
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(height: 300)
                        .overlay(Text("Tap to select an image").foregroundColor(.white))
                        .onTapGesture {
                            showingImagePicker = true
                        }
                }

                Button("Upload Story") {
                    if let selectedImage = selectedImage, let imageData = selectedImage.jpegData(compressionQuality: 0.8) {
                        storyManager.uploadStory(user: user, imageData: imageData) { success in
                            if success {
                                print("Story uploaded successfully!")
                            } else {
                                print("Failed to upload story.")
                            }
                        }
                    }
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Upload Story")
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $selectedImage)
            }
        }
    }
}



#Preview {
    UploadStoryView()
}
