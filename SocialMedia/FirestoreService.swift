//
//  FirestoreService.swift
//  SocialMedia
//
//  Created by Duizzz on 16/3/25.
//
import Firebase
import FirebaseFirestore


class FirestoreService: ObservableObject {
    private let db = Firestore.firestore()
    @Published var stories: [StoryModel] = []

    func fetchStories() {
        db.collection("stories").order(by: "timestamp", descending: true).addSnapshotListener { snapshot, error in
            if let error = error {
                print("Error fetching stories: \(error)")
                return
            }
            
            self.stories = snapshot?.documents.compactMap { document in
                try? document.data(as: StoryModel.self)
            } ?? []
        }
    }

    // Upload a new story
    func addStory(user: User, storyImageURL: String, completion: @escaping (Bool) -> Void) {
        let newStory = StoryModel(
            userId: user.id,
            firstName: user.firstName,
            lastName: user.lastName,
            profileImage: user.email,
            storyImage: storyImageURL,
            timestamp: Date()
        )

        do {
            _ = try db.collection("stories").addDocument(from: newStory) { error in
                completion(error == nil)
            }
        } catch {
            print("Error adding story: \(error)")
            completion(false)
        }
    }
}
