//
//  WeatherDataManager.swift
//  Soyou
//
//  Created by 김민종 on 2022/05/02.
//

import Foundation
import Alamofire

class WeatherDataManager: WeatherDataManagerDelegate {
    func getWeatherData(delegate: WeatherDelegate) {
        AF.request("url",
                   method: .get,
                   headers: nil)
        .validate()
        .responseDecodable(of: WeatherDataResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessGetWeatherData(response)
                }
            case .failure:
                delegate.failedToGetWeatherData(message: "서버통신 실패")
            }
            
            
            
        }
                   
        )
    }
}
