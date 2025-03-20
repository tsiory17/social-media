//
//  StoriesView.swift
//  FacebookUIChallenge
//
//  Created by Roan Thai Quynh Vy on 6/2/25.
//
import SwiftUI

struct StoryView: View {
    @StateObject private var firestoreService = FirestoreService()
    @State private var isShowingUploadStoryView = false
    let user: User

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                // Create Story Button
                Button(action: {
                    isShowingUploadStoryView = true
                }) {
                    VStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                        
                        Text("Create Story")
                            .font(.caption)
                            .foregroundColor(.white)
                            .bold()
                    }
                    .frame(width: 120, height: 200)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 5)
                }
                .fullScreenCover(isPresented: $isShowingUploadStoryView) {
                    UploadStoryView(user: user)
                }

                // Show Fetched Stories
                ForEach(firestoreService.stories) { story in
                    StoriesCardView(story: story)
                }
            }
            .padding(.horizontal, 10)
            .onAppear {
                firestoreService.fetchStories()
            }
        }
    }
}

