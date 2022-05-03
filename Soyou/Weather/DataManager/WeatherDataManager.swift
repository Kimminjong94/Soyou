//
//  WeatherDataManager.swift
//  Soyou
//
//  Created by 김민종 on 2022/05/02.
//

import Foundation
import Alamofire
import CoreLocation

class WeatherDataManager: WeatherDataManagerDelegate {
    func getWeatherData(cityName: String, delegate: WeatherDelegate) {
        AF.request("https://api.openweathermap.org/data/2.5/weather?appid=f0c0f1d863f4c9dece58a3ed389503e9&units=metric&q=\(cityName)",
                   method: .get,
                   headers: nil)
        .validate()
        .responseDecodable(of: WeatherDataResponse.self) { response in
            switch response.result {
            case .success(let response):
                let id = response.weather[0].id
                let temp = response.main.temp
                let name = response.name
                
                let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
                
                delegate.didSuccessGetWeatherData(weather)

                
                print(weather.temperatureString)
//                print(getConditionName(weatherId: id))
                
            case .failure:
                delegate.failedToGetWeatherData(message: "서버통신 실패")
                print(response)
            }
        }
                   
        
    }
    func getMyplaceWeatherData(latitude: CLLocationDegrees, longitude: CLLocationDegrees, delegate: WeatherDelegate) {
        AF.request("https://api.openweathermap.org/data/2.5/weather?appid=f0c0f1d863f4c9dece58a3ed389503e9&units=metric&lat=\(latitude)&lon=\(longitude)",
                   method: .get,
                   headers: nil)
        .validate()
        .responseDecodable(of: WeatherDataResponse.self) { response in
            switch response.result {
            case .success(let response):
                let id = response.weather[0].id
                let temp = response.main.temp
                let name = response.name
                
                let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
                
                delegate.didSuccessGetWeatherData(weather)
            case .failure:
                delegate.failedToGetWeatherData(message: "실패")
                print(response)
            }
        }
    }
    

}
