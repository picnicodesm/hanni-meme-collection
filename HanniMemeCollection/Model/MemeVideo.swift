//
//  MemeVideo.swift
//  HanniMemeCollection
//
//  Created by 김상민 on 8/12/24.
//

import Foundation


struct MemeVideo: Hashable {
    var title: String
    var urlString: String = ""
    var key: String {
        if let range = urlString.range(of: "shorts/") {
            print(range)
            guard let videoID = urlString[range.upperBound...].split(separator: "/").first else {
                return ""
            }
            return String(videoID)
        }
        return ""
    }
}

extension MemeVideo {
    static let memes = [
        MemeVideo(title: "Fㅏ니", urlString: "https://www.youtube.com/shorts/cxo-IeAG2T4"),
        MemeVideo(title: "눈사람 하니", urlString: "https://www.youtube.com/shorts/G25eg25el8s"),
        MemeVideo(title: "킴민지 짱팬 하니", urlString: "https://www.youtube.com/shorts/Jsm1qk2avyw")
    ]
}
