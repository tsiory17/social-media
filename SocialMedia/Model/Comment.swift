//
//  Comment.swift
//  SocialMedia
//
//  Created by Duizzz on 21/3/25.
//

import Foundation
import FirebaseFirestore

struct Comment: Codable, Identifiable {
    @DocumentID var id: String?
    let userId: String
    let userName: String
    let content: String
    let timestamp: Date
}
