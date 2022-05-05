//
//  QuotesDataManagerDelegate.swift
//  Soyou
//
//  Created by 김민종 on 2022/05/03.
//

import Foundation


protocol QuotesDelegate {
    func didSuccessGetQuotes(_ result: [Quotes])
    func failedToGetQuotes(message: String)
}

protocol PhotoDelegate {
    func didSuccessGetPhoto(_ result: URLS)
    func failedToGetPhoto(message: String)
}


protocol QuotesDataManagerDelegate {
    func getQuotesData(delegate: QuotesDelegate)
    func getQuotesTagPhoto(tagName: String, delegate: PhotoDelegate)
}
