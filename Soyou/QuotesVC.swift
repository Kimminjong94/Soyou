//
//  QuotesVC.swift
//  Soyou
//
//  Created by 김민종 on 2022/04/28.
//

import UIKit

class QuotesVC: UIViewController, QuotesDelegate {
    

    var quotesManager: QuotesDataManagerDelegate = QuotesDataManager()
    
    @IBOutlet weak var quotesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quotesManager.getQuotesData(delegate: self)
        

    }
    
    func didSuccessGetQuotes(_ result: String) {
        self.quotesLabel.text = result
    }
    func failedToGetQuotes(message: String) {
        print(message)
    }

}
