//
//  WeatherDataResponse.swift
//  Soyou
//
//  Created by 김민종 on 2022/05/02.
//

import Foundation

struct WeatherDataResponse: Codable {
    let name: String
    let weather: [WeatherDataString]
    let main: WeatherData

}
struct WeatherDataString: Codable {
    let description: String
    let id: Int
}

struct WeatherData: Codable {
    let temp: Double
}
