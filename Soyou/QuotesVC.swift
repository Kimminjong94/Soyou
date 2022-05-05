//
//  QuotesVC.swift
//  Soyou
//
//  Created by 김민종 on 2022/04/28.
//

import UIKit

class QuotesVC: UIViewController {

    var quotesManager: QuotesDataManagerDelegate = QuotesDataManager()
    
    @IBOutlet weak var quotesLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var urlImage: UIImageView!
    
    var tagName: String = "cloud"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async() {
            self.quotesManager.getQuotesData(delegate: self)

        }


    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quotesLabel.layer.zPosition = 999
        authorLabel.layer.zPosition = 999
        

        DispatchQueue.global(qos: .background).sync {
            self.quotesManager.getQuotesTagPhoto(tagName: tagName, delegate: self)

        }

        
        

    }


}

extension QuotesVC: QuotesDelegate, PhotoDelegate {
    
    func didSuccessGetQuotes(_ result: [Quotes]) {
        self.quotesLabel.text = result[0].text
        self.authorLabel.text = result[0].author
        self.tagName = result[0].tag
        
    }
    func failedToGetQuotes(message: String) {
        print(message)
    }
    
    func didSuccessGetPhoto(_ result: URLS) {

        let url = URL(string: result.raw)
        
        if let data = try? Data(contentsOf: url!){
            self.urlImage.image = UIImage(data: data)

        }
        
        print(result)
    }
    
    func failedToGetPhoto(message: String) {
        print(message)
    }
}
