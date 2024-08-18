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
            guard let videoID = urlString[shortsRange.upperBound...].split(separator: "/").first else {
                return ""
            }
            return String(videoID)
        }
        
        if let videoRange = urlString.range(of: "watch?v=") {
            guard let videoID = urlString[videoRange.upperBound...].split(separator: "=").first else {
                return ""
            }
            return String(videoID)
        }
        return ""
    }
    
    mutating func toggleFavorite() -> Bool {
        if isFavorite {
            makeNotFavorite()
            return false
        } else {
            makeFavorite()
            return true
        }
    }
    
    func getThumbnailData() async -> Data? {
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

extension MemeVideo {
    private mutating func makeFavorite() {
        guard let index = MemeVideo.memes.firstIndex(of: self) else { return }
        isFavorite = true
        updateData(self, at: index)
        addToFavorites()
    }
    
    private mutating func makeNotFavorite() {
        guard let index = MemeVideo.memes.firstIndex(of: self) else { return }
        isFavorite = false
        updateData(self, at: index)
        removeFromFavorites()
    }
    
    private mutating func addToFavorites() {
        MemeVideo.favortites.append(self)
    }
    
    private mutating func removeFromFavorites() {
        MemeVideo.favortites = MemeVideo.favortites.filter {
            $0.id != self.id
        }
    }
    
    private func updateData(_ newData: MemeVideo, at index: Array.Index) {
        MemeVideo.memes.remove(at: index)
        MemeVideo.memes.insert(newData, at: index)
    }
}

extension MemeVideo {
    static var memes = [
        MemeVideo(title: "Fㅏ니", urlString: "https://www.youtube.com/shorts/cxo-IeAG2T4"),
        MemeVideo(title: "눈사람 하니", urlString: "https://www.youtube.com/shorts/G25eg25el8s"),
        MemeVideo(title: "킴민지 짱팬 하니", urlString: "https://www.youtube.com/shorts/Jsm1qk2avyw"),
        MemeVideo(title: "수달첼린지 하니", urlString: "https://www.youtube.com/shorts/psa9j9KnH4Q"),
        MemeVideo(title: "페이퍼랜턴", urlString: "https://www.youtube.com/shorts/-I5pM9hEMzA"),
        MemeVideo(title: "뜬겁새로(?)", urlString: "https://www.youtube.com/watch?v=ccINBTE_OJw"),
        MemeVideo(title: "준비 갈 완료", urlString: "https://www.youtube.com/watch?v=3aevxVamt50"),
        MemeVideo(title: "급발진 라이브", urlString: "https://www.youtube.com/shorts/p_ZiA2bRJxA")
    ]
    
    static var favortites: [MemeVideo] = []
}
