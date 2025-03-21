//
//  FirebaseCommentManager.swift
//  SocialMedia
//
//  Created by Duizzz on 21/3/25.
//

import Foundation
import Firebase
import FirebaseFirestore


class FirebaseCommentManager: ObservableObject {
    private let db = Firestore.firestore()
    @Published var comments: [Comment] = []

    func fetchComments(forPostId postId: String) {
        db.collection("posts").document(postId).collection("comments")
            .order(by: "timestamp", descending: false)
            .addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents else {
                    print("❌ Failed to fetch comments: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }

                self.comments = documents.compactMap { doc in
                    try? doc.data(as: Comment.self)
                }
            }
    }

    func addComment(toPostId postId: String, comment: Comment) {
        do {
            _ = try db.collection("posts")
                .document(postId)
                .collection("comments")
                .addDocument(from: comment)
        } catch {
            print("❌ Error adding comment: \(error.localizedDescription)")
        }
    }
}

