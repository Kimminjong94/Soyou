//
//  WeatherProtocol.swift
//  Soyou
//
//  Created by 김민종 on 2022/05/02.
//

import Foundation
import CoreLocation

protocol WeatherDelegate {
    func didSuccessGetWeatherData(_ result: WeatherModel)
    func failedToGetWeatherData(message: String)
}


protocol WeatherDataManagerDelegate {
    func getWeatherData(cityName: String, delegate: WeatherDelegate)
    func getMyplaceWeatherData(latitude: CLLocationDegrees, longitude: CLLocationDegrees, delegate: WeatherDelegate)
}
