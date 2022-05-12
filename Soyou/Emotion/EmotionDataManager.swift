//
//  EmotionDataManager.swift
//  Soyou
//
//  Created by 김민종 on 2022/05/12.
//

import Foundation


class EmotionDataManager: delegate {
    
    func getQuotesTagPhoto(tagName: String, delegate: PhotoDelegate) {
        let group = DispatchGroup()
        group.enter()
        
        DispatchQueue.global(qos: .userInitiated).async {
            AF.request("https://api.unsplash.com/search/photos?page=1&query=\(tagName)&client_id=9xBbg0WlJNPczWsPplzB38AOIIBLXt6ugKaX6kzbj0o",
                       method: .get,
                       headers: nil)
            .validate()
            .responseDecodable(of: PhotoResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    delegate.didSuccessGetPhoto(response.results[0].urls)
    //                delegate.didSuccessGetQuotes(response)
                case .failure:
                    print(response)
                    
                }
            }
        }

    }
}


