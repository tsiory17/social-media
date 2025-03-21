//
//  FirestoreStoryManager.swift
//  SocialMedia
//
//  Created by Duizzz on 20/3/25.
//

import Foundation
import FirebaseFirestore

import Foundation
import FirebaseFirestore
import FirebaseStorage

class FirestoreStoryManager: ObservableObject {
    @Published var stories: [StoryModel] = []
    private let db = Firestore.firestore()
    private let storage = Storage.storage()
    private let collectionName = "stories"

    // Upload Story with Image to Firebase Storage
    func uploadStory(user: User, imageData: Data, completion: @escaping (Bool) -> Void) {
        let storyID = UUID().uuidString
        let storageRef = storage.reference().child("stories/\(storyID).jpg")

        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
                completion(false)
                return
            }

            storageRef.downloadURL { url, error in
                if let error = error {
                    print("Error getting image URL: \(error.localizedDescription)")
                    completion(false)
                    return
                }

                guard let storyImageURL = url?.absoluteString else {
                    completion(false)
                    return
                }

                let storyData: [String: Any] = [
                    "id": storyID,
                    "userId": user.id,
                    "firstName": user.firstName,
                    "lastName": user.lastName,
                    "profileImage": "", 
                    "storyImage": storyImageURL,
                    "timestamp": Timestamp()
                ]

                self.db.collection(self.collectionName).document(storyID).setData(storyData) { error in
                    if let error = error {
                        print("Error uploading story: \(error.localizedDescription)")
                        completion(false)
                    } else {
                        DispatchQueue.main.async {
                            self.fetchStories()
                        }
                        completion(true)
                    }
                }
            }
        }
    }

    // Fetch Stories
    func fetchStories() {
        db.collection(collectionName)
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error fetching stories: \(error.localizedDescription)")
                    return
                }

                DispatchQueue.main.async {
                    self.stories = snapshot?.documents.compactMap { document in
                        try? document.data(as: StoryModel.self)
                    } ?? []
                }
            }
    }
}
