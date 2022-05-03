//
//  QuotesDataManagerDelegate.swift
//  Soyou
//
//  Created by 김민종 on 2022/05/03.
//

import Foundation


protocol QuotesDelegate {
    func didSuccessGetQuotes(_ result: String)
    func failedToGetQuotes(message: String)
}

protocol QuotesDataManagerDelegate {
    func getQuotesData(delegate: QuotesDelegate)
}
