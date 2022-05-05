//
//  QuotesResponse.swift
//  Soyou
//
//  Created by 김민종 on 2022/05/03.
//

import Foundation

struct QuotesResponse: Decodable {
    let status: Int
    let message: String
    let count: Int
    let quotes: [Quotes]
    
}

struct Quotes: Decodable {
    let text: String
    let author: String
    let tag: String
    
}

