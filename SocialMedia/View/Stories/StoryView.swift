//
//  StoryView.swift
//  SocialMedia
//
//  Created by Duizzz on 20/3/25.
//

import SwiftUI

import Firebase
import FirebaseFirestore




struct StoryView: View {
    @StateObject var storyManager = FirestoreStoryManager()
    @State private var isShowingUpload = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Stories")
                        .font(.largeTitle.bold())
                    Spacer()
                    Button(action: {
                        isShowingUpload = true
                    }) {
                        Label("Add", systemImage: "plus.circle")
                    }
                }
                .padding([.horizontal, .top])

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(storyManager.stories) { story in
                            VStack {
                                if let url = URL(string: story.storyImage) {
                                    AsyncImage(url: url) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 100, height: 150)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                }

                                Text(story.firstName)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding()
                }
                Spacer()
            }
 
            .onAppear {
                storyManager.fetchStories()
            }
            .sheet(isPresented: $isShowingUpload) {
                UploadStoryView()
            }
        }
    }
}


#Preview {
    StoryView()
}
