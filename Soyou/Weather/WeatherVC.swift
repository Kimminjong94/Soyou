//
//  ViewController.swift
//  Soyou
//
//  Created by 김민종 on 2022/04/26.
//

import UIKit

class WeatherVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        searchTF.text = ""
    }
    
    
}

