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
}

extension MemeVideo {
    static let mock = [
        MemeVideo(title: "Fㅏ니"),
        MemeVideo(title: "snowman hanni"),
        MemeVideo(title: "Kim Minji~")
    ]
}
