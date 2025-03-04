//
//  LoginViewModel.swift
//  SocialMedia
//
//  Created by Tsiory Rakotoarimanana on 2025-03-03.
//

import Foundation
class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
