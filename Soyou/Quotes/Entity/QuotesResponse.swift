//
//  QuotesResponse.swift
//  Soyou
//
//  Created by 김민종 on 2022/05/03.
//

import Foundation

struct QuotesResponse: Decodable {
    let result: [Result]
    
}
struct Result: Decodable {
    let text: String
    let authoer: String
}

