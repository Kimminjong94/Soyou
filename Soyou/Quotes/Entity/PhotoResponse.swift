//
//  PhotoResponse.swift
//  Soyou
//
//  Created by 김민종 on 2022/05/04.
//

import Foundation

struct PhotoResponse: Decodable {
    let total: Int
    let results: [PhotoUrl]
}

struct PhotoUrl: Decodable {
    let id: String
    let urls: URLS
}
struct URLS: Decodable {
    let raw: String
}
