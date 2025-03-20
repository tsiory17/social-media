//
//  UploadStoryView.swift
//  SocialMedia
//
//  Created by Duizzz on 16/3/25.
//

import SwiftUI
import PhotosUI

struct UploadStoryView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage?
    @State private var isUploading = false
    @EnvironmentObject var firestoreService: FirestoreService
    let user: User

    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
            } else {
                PhotosPicker("Select Image", selection: $selectedItem, matching: .images)
                    .onChange(of: selectedItem) { newItem in
                        loadImage(from: newItem)
                    }
                    .padding()
            }

            if isUploading {
                ProgressView()
            } else {
                Button("Upload Story") {
                    isUploading = true
                    uploadStory()
                }
                .disabled(selectedImage == nil)
                .padding()
            }
        }
        .navigationTitle("Add Story")
    }

    private func loadImage(from item: PhotosPickerItem?) {
        guard let item else { return }
        
        item.loadTransferable(type: Data.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let data, let uiImage = UIImage(data: data) {
                        self.selectedImage = uiImage
                    }
                case .failure(let error):
                    print("Error loading image: \(error.localizedDescription)")
                }
            }
        }
    }

    private func uploadStory() {
        guard let image = selectedImage else { return }

        ImageUploader.uploadImage(image) { url in
            if let url = url {
                firestoreService.addStory(user: user, storyImageURL: url) { success in
                    isUploading = false
                    if success {
                        print("Story uploaded successfully")
                    } else {
                        print("Story upload failed")
                    }
                }
            }
        }
    }
}
