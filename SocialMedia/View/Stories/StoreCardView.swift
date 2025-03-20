//
//  StoriesCardView.swift
//  FacebookUIChallenge
//
//  Created by Roan Thai Quynh Vy on 6/2/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct StoriesCardView: View {
    let story: StoryModel

    var body: some View {
        ZStack(alignment: .topLeading) {
            WebImage(url: URL(string: story.storyImage))
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 350)
                .clipShape(RoundedRectangle(cornerRadius: 20))

            WebImage(url: URL(string: story.profileImage))
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 3))
                .offset(x: 10, y: 10)

            VStack {
                Spacer()
                Text("\(story.firstName) \(story.lastName)")
                    .foregroundColor(.white)
                    .bold()
                    .font(.title3)
                    .padding()
                    .frame(width: 170, height: 50)
            }
        }
        .frame(width: 200, height: 350)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 5)
    }
}
