//
//  FirebasePostManager.swift
//  SocialMedia
//
//  Created by Duizzz on 20/3/25.
//


import Foundation
import Firebase
import FirebaseFirestore

class FirebasePostManager: ObservableObject {
    private let db = Firestore.firestore()
    @Published var posts: [Post] = []

    // MARK: - Fetch Posts
    func fetchPosts() {
        db.collection("posts")
            .order(by: "timestamp", descending: true)
            .addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents else {
                    print("❌ No documents: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }

                self.posts = documents.compactMap { document in
                    try? document.data(as: Post.self)
                }
            }
    }

    func uploadPost(content: String, user: User, image: UIImage? = nil) {
        let post = Post(
            userId: user.id,
            userName: "\(user.firstName) \(user.lastName)",
            content: content,
            timestamp: Date(),
            imageUrl: ""
    
        )

        do {
            _ = try db.collection("posts").addDocument(from: post)
            
        } catch {
            print("❌ Error saving post: \(error.localizedDescription)")
        }
    }
    
    // Like or unlike a post
    func toggleLike(post: Post, userId: String) {
        guard let postId = post.id else { return }

        var updatedLikes = post.likes
        if let index = updatedLikes.firstIndex(of: userId) {
            updatedLikes.remove(at: index) // unlike
        } else {
            updatedLikes.append(userId) // like
        }

        db.collection("posts").document(postId).updateData(["likes": updatedLikes])
    }

    // Add comment
    func addComment(to post: Post, comment: Comment) {
        guard let postId = post.id else { return }

        var updatedComments = post.comments
        updatedComments.append(comment)

        do {
            let encoded = try Firestore.Encoder().encode(updatedComments)
            db.collection("posts").document(postId).updateData(["comments": encoded])
        } catch {
            print("❌ Error encoding comments: \(error)")
        }
    }

}

