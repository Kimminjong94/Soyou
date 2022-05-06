//
//  SocialLoginVC.swift
//  Soyou
//
//  Created by 김민종 on 2022/05/06.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

class SocialLoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func kakaoLoginButton(_ sender: Any) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("카카오 로그인 성공")
                    
                    
                    
                    _ = oauthToken
                    /// 로그인 관련 메소드 추가
                }
            }
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
