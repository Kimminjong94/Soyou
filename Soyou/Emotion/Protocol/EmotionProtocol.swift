//
//  EmotionProtocol.swift
//  Soyou
//
//  Created by 김민종 on 2022/05/14.
//

import Foundation


protocol EmotionProtocol {
    func didSuccessGetEmotion(_ result: [Quotes])
    func failedToGetEmotion(message: String)
}

protocol EmotionDelegate {
    func didSuccessGetPhotoEmotion(_ result: URLS)
    func failedToGetPhotoEmotion(message: String)
}


protocol EmotionDataManagerDelegate {
    func getEmotionData(delegate: EmotionDelegate)
    func getEmotionTagPhoto(tagName: String, delegate: EmotionDelegate)
}
