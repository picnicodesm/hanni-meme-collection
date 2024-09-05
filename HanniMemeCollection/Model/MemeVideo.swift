//
//  MemeVideo.swift
//  HanniMemeCollection
//
//  Created by 김상민 on 8/12/24.
//

import Foundation


struct MemeVideo: Hashable {
    let id = UUID()
    var title: String
    var urlString: String
    var isFavorite: Bool = false
    var key: String {
        if let shortsRange = urlString.range(of: "shorts/") {
            let key = urlString[shortsRange.upperBound...]
            return String(key)
        }
        
        if let videoRange = urlString.range(of: "watch?v=") {
            let key = urlString[videoRange.upperBound...]
            return String(key)
        }
        return ""
    }
    
    mutating func toggleFavorite() -> Bool {
        self.isFavorite.toggle()
        return self.isFavorite
    }
    
    func getThumbnailData() async -> Data? {
        if key.isEmpty { return nil }
        let thumbnailString = "https://img.youtube.com/vi/\(key)/0.jpg"
        guard let url = URL(string: thumbnailString) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            print("Error fetching thumbnail data: \(error)")
            return nil
        }
    }
}

