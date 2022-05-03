//
//  QuotesDataManager.swift
//  Soyou
//
//  Created by 김민종 on 2022/05/03.
//

import Foundation
import Alamofire

class QuotesDataManager: QuotesDataManagerDelegate {
    func getQuotesData(delegate: QuotesDelegate){
        AF.request("https://type.fit/api/quotes",
                   method: .get,
                   headers: nil)
        .validate()
        .responseDecodable(of: QuotesResponse.self) { response in
            switch response.result {
            case .success(let response):
                print(response)
//                delegate.didSuccessGetQuotes(response)
            case .failure:
                print(response)
                
            }
        }
    }
}
