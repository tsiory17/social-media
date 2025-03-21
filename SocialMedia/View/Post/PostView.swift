//
//  PostView.swift
//  SocialMedia
//
//  Created by Duizzz on 20/3/25.
//


import SwiftUI

struct PostView: View {
    @StateObject private var postManager = FirebasePostManager()
    @State private var newPostText = ""

    let currentUser: User

    var body: some View {
        VStack(spacing: 12) {
            // Feed Header
            HStack{
                Text("Feed")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                Spacer()
            }.padding(.leading)

            Divider() // 🔹 Adds a subtle separator

            // Post Input Section
            HStack(alignment: .top, spacing: 8) {
                // Profile Image Placeholder
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                
                
                TextField("What's on your mind?", text: $newPostText, axis: .vertical)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .multilineTextAlignment(.leading)
                    .frame(height: 50)
                
                
                Button(action: {
                    if !newPostText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        postManager.uploadPost(content: newPostText, user: currentUser)
                        newPostText = ""
                    }
                }) {
                    Text("Post")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 20)
                        .background(newPostText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? Color.gray : Color.blue)
                        .cornerRadius(10)
                }
                .disabled(newPostText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                
            }
            .padding(.horizontal)
            .padding(.bottom, 5)

            Divider() // 🔹 Separator before posts

            // Posts List
            LazyVStack(alignment: .leading, spacing: 12) {
                ForEach(postManager.posts) { post in
                    VStack(alignment: .leading, spacing: 8) {
                        // User & Timestamp
                        HStack {
                            Text(post.userName)
                                .font(.headline)
                                .bold()
                                .foregroundColor(.primary)

                            Spacer()

                            Text(post.timestamp, style: .time)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }

                        // Post Content
                        Text(post.content)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)

                        // Like & Comment Buttons
                        HStack {
                            // Like Button
                            Button(action: {
                                postManager.toggleLike(post: post, userId: currentUser.id)
                            }) {
                                HStack(spacing: 4) {
                                    Image(systemName: post.likes.contains(currentUser.id) ? "heart.fill" : "heart")
                                        .foregroundColor(.red)
                                    Text("\(post.likes.count)")
                                }
                            }
                            .buttonStyle(BorderlessButtonStyle())

                            Spacer()

                            // Comment Button
                            NavigationLink(
                                destination: CommentView(
                                    post: post,
                                    currentUser: currentUser
                                )
                            ) {
                                Text("Comments")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(12)
                    .shadow(radius: 1)
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            postManager.fetchPosts()
        }
    }
}

#Preview {
    PostView(currentUser: User(
        id: "sampleID",
        firstName: "Duy",
        lastName: "Roan",
        age: 25,
        email: "duy@gmail.com",
        isCurrentUser: true,
        profileImage: "avatar 1"
    ))
}
