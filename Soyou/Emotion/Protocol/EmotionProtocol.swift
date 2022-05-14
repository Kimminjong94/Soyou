//
//  EmotionProtocol.swift
//  Soyou
//
//  Created by 김민종 on 2022/05/14.
//

import Foundation


protocol EmotionProtocol {
    func didSuccessGetQuotes(_ result: [Quotes])
    func failedToGetQuotes(message: String)
}

protocol EmotionDelegate {
    func didSuccessGetPhoto(_ result: URLS)
    func failedToGetPhoto(message: String)
}


protocol QuotesDataManagerDelegate {
    func getQuotesData(delegate: EmotionDelegate)
    func getQuotesTagPhoto(tagName: String, delegate: EmotionDelegate)
}
