//
//  EmotionVC.swift
//  Soyou
//
//  Created by 김민종 on 2022/04/28.
//

import UIKit

class EmotionVC: UIViewController {

    @IBOutlet weak var badLabel: UIButton!
    @IBOutlet weak var fineLabel: UIButton!
    @IBOutlet weak var greatLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        badLabel.layer.cornerRadius = 15
        fineLabel.layer.cornerRadius = 15
        greatLabel.layer.cornerRadius = 15


    }

}
