//
//  ImageUploader.swift
//  SocialMedia
//
//  Created by Duizzz on 16/3/25.
//

import FirebaseStorage
import UIKit
import Foundation

class ImageUploader {
    static func uploadImage(_ image: UIImage, completion: @escaping (String?) -> Void) {
        let storageRef = Storage.storage().reference().child("stories/\(UUID().uuidString).jpg")
        
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(nil)
            return
        }
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("Upload error: \(error)")
                completion(nil)
                return
            }
            
            storageRef.downloadURL { url, _ in
                completion(url?.absoluteString)
            }
        }
    }
}
