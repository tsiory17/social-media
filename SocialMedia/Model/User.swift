//
//  User.swift
//  SocialMedia
//
//  Created by Tsiory Rakotoarimanana on 2025-03-03.
//

struct User: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let age: Int
    let email: String
    let isCurrentUser: Bool
    let profileImage: String?
}
