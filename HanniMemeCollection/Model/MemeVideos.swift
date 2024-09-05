//
//  MemeVideos.swift
//  HanniMemeCollection
//
//  Created by 김상민 on 8/27/24.
//

import Foundation

class MemeVideos {
    private(set) var memes: [MemeVideo] = [
        MemeVideo(title: "Fㅏ니", urlString: "https://www.youtube.com/shorts/cxo-IeAG2T4"),
        MemeVideo(title: "눈사람 하니", urlString: "https://www.youtube.com/shorts/G25eg25el8s"),
        MemeVideo(title: "킴민지 짱팬 하니", urlString: "https://www.youtube.com/shorts/Jsm1qk2avyw"),
        MemeVideo(title: "수달첼린지 하니", urlString: "https://www.youtube.com/shorts/psa9j9KnH4Q"),
        MemeVideo(title: "페이퍼랜턴", urlString: "https://www.youtube.com/shorts/-I5pM9hEMzA"),
        MemeVideo(title: "준비 갈 완료", urlString: "https://www.youtube.com/watch?v=3aevxVamt50"),
        MemeVideo(title: "급발진 라이브", urlString: "https://www.youtube.com/shorts/p_ZiA2bRJxA")
    ]
    
    private(set) var favorites: [MemeVideo] = []
    
    func updateFavorites(_ video: MemeVideo) {
        guard let index = memes.firstIndex(where: {$0.id == video.id}) else { return }
        memes[index] = video
        
        if video.isFavorite {
            addToFavorites(video)
        } else {
            removeFromFavorites(video)
        }
    }
    
    private func addToFavorites(_ video: MemeVideo) {
        favorites.append(video)
    }
    
    private func removeFromFavorites(_ video: MemeVideo) {
        favorites = favorites.filter {
            $0.id != video.id
        }
    }
}
