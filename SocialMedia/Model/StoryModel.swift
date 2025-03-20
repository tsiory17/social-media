//
//  StoryModel.swift
//  FacebookUIChallenge
//
//  Created by Roan Thai Quynh Vy on 6/2/25.
//

import Foundation
import FirebaseFirestore

struct StoryModel: Identifiable, Codable {
    @DocumentID var id: String?
    var userId: String
    var firstName: String
    var lastName: String
    var profileImage: String
    var storyImage: String
    var timestamp: Date
}

