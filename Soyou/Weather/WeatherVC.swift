//
//  ViewController.swift
//  Soyou
//
//  Created by 김민종 on 2022/04/26.
//

import UIKit
import CoreLocation

class WeatherVC: UIViewController, UITextFieldDelegate, WeatherDelegate {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var searchTF: UITextField!
    
    @IBOutlet weak var myLocation: UIButton!
    @IBOutlet weak var emotionLabel: UIButton!
    
    var weatherManager: WeatherDataManagerDelegate = WeatherDataManager()

    let locationManager = CLLocationManager()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emotionLabel.layer.cornerRadius = 15

        
        searchTF.delegate = self
        
    }
    
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchTF.endEditing(true)
        print(searchTF.text!)
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type your city"
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTF.endEditing(true)
        print(searchTF.text!)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTF.text {
            weatherManager.getWeatherData(cityName: city, delegate: self)
        }
        
        searchTF.text = ""
    }
    
    @IBAction func myLocationButtonPressed(_ sender: UIButton) {
//        weatherManager.getMyplaceWeatherData(latitude: lat, longitude: lon, delegate: self)
        locationManager.requestLocation()
    }
    
}

extension WeatherVC {
    func didSuccessGetWeatherData(_ result: WeatherModel) {
        self.cityName.text = result.cityName
        self.temperatureLabel.text = result.temperatureString + " °C"
        
        DispatchQueue.main.async {
            self.weatherImage.image = UIImage(systemName: result.conditionName)

        }
    }
    
    func failedToGetWeatherData(message: String) {
        print(message)
    }
}

//MARK: - 로케이션 확인


extension WeatherVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()	
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            weatherManager.getMyplaceWeatherData(latitude: lat, longitude: lon, delegate: self)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
