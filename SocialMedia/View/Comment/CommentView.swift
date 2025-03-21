//
//  CommentView.swift
//  SocialMedia
//
//  Created by Duizzz on 21/3/25.
//

import SwiftUI

struct CommentView: View {
    var post: Post
    var currentUser: User
    @StateObject private var commentManager = FirebaseCommentManager()
    @State private var newComment = ""

    var body: some View {
        VStack {
            List(commentManager.comments) { comment in
                VStack(alignment: .leading) {
                    Text(comment.userName).bold()
                    Text(comment.content)
                    Text(comment.timestamp, style: .time)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }

            HStack {
                TextField("Add a comment...", text: $newComment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Send") {
                    let comment = Comment(
                        userId: currentUser.id,
                        userName: "\(currentUser.firstName) \(currentUser.lastName)",
                        content: newComment,
                        timestamp: Date()
                    )
                    commentManager.addComment(toPostId: post.id ?? "", comment: comment)
                    newComment = ""
                }
            }
            .padding()
        }
        .navigationTitle("Comments")
        .onAppear {
            if let postId = post.id {
                commentManager.fetchComments(forPostId: postId)
            }
        }
    }
}

#Preview {
    CommentView(
        post: Post(
            id: "",
            userId: "",
            userName: "Duy",
            content: "That was amazing!",
            timestamp: Date(),
            likes: [],
            comments: [],
            imageUrl: ""
        ),
        currentUser: User(
            id: "",
            firstName: "Duy",
            lastName: "Roan",
            age: 22,
            email: "duy@roan.com",
            isCurrentUser: true,
            profileImage: "avatar 1"
        )
    )
}
