//
//  WeatherProtocol.swift
//  Soyou
//
//  Created by 김민종 on 2022/05/02.
//

import Foundation

protocol WeatherDelegate {
    func didSuccessGetWeatherData(_ result: String)
    func failedToGetWeatherData(message: String)
}


protocol WeatherDataManagerDelegate {
    func getWeatherData(delegate: WeatherDelegate)
}
