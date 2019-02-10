//
//  userNavigationController.swift
//  obu
//
//  Created by namik kaya on 13.01.2019.
//  Copyright © 2019 namik kaya. All rights reserved.
//

import UIKit
import Firebase

class userNavigationController: UINavigationController {
    let TAG:String = "userNavigationController: "
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Login kontrolu")
        navigationShowStatus(status: true)
        checkLogin()
    }
    
    private func checkLogin(){
        if Auth.auth().currentUser?.uid == nil {
            print("Login Değil")
        }else{
            //let uid = Auth.auth().currentUser?.uid
            print("Kullanıcı login")
        }
    }
    
    private func navigationShowStatus(status:Bool) {
        self.navigationBar.isHidden = status
    }

}
