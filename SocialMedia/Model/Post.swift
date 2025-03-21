//
//  Post.swift
//  SocialMedia
//
//  Created by Duizzz on 20/3/25.
//

import Foundation
import FirebaseFirestore

struct Post: Codable, Identifiable {
    @DocumentID var id: String?
    let userId: String
    let userName: String
    let content: String
    let timestamp: Date
    var likes: [String] = [] 
    var comments: [Comment] = []
    let imageUrl: String?
}


