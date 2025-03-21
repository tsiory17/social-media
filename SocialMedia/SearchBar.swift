//
//  SearchBar.swift
//  FacebookApp
//
//  Created by Roan Thai Quynh Vy on 31/1/25.
//

import SwiftUI

struct SearchBar: View {
    var body: some View {
        VStack(spacing: 5) { // Reduce spacing between elements
            
            HStack(alignment: .center, spacing: 5) {
                Text("Social Media")
                    .foregroundColor(.blue)
                    .font(.title)
                    .padding(.leading, 5)
                    
                
                Spacer()
                
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .frame(width: 30, height: 20)
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .frame(width: 30, height: 20)
                Image(systemName: "message.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .frame(width: 35, height: 25)
            }
            .padding(.horizontal)
            
            HStack(alignment: .center, spacing: 5) {
                Image("demo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 50)
                    .clipShape(Circle())
                
                Text("What's on your mind?")
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                    .padding(.leading, 5)
                
                Spacer()

                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .frame(width: 30, height: 20)
            }
            .padding(.horizontal) // Keep horizontal padding but remove excessive padding
        }
    }
}

#Preview {
    SearchBar()
}
