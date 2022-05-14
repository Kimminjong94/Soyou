//
//  EmotionResponse.swift
//  Soyou
//
//  Created by 김민종 on 2022/05/13.
//

import Foundation

struct EmotionResponse: Decodable {
    let total: Int
    let results: [EmotionPhotoUrl]
}

struct EmotionPhotoUrl: Decodable {
    let id: String
    let urls: PhotoURLS
}
struct PhotoURLS: Decodable {
    let raw: String
}
