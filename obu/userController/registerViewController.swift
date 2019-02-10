//
//  registerViewController.swift
//  obu
//
//  Created by namik kaya on 6.01.2019.
//  Copyright © 2019 namik kaya. All rights reserved.
//

import UIKit
import LocalAuthentication

class registerViewController: UIViewController {

    @IBOutlet weak var registerButton: potatoButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        touchIdAction()
    }
    
    func touchIdAction() {
        print("hello there!.. You have clicked the touch ID")
        let myContext = LAContext()
        let myLocalizedReasonString = "Biometric Authntication testing !! "
        
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { success, evaluateError in
                    
                    DispatchQueue.main.async {
                        if success {
                            // User authenticated successfully, take appropriate action
                            //self.successLabel.text = "Awesome!!... User authenticated successfully"
                            print("Awesome!!... User authenticated successfully")
                        } else {
                            // User did not authenticate successfully, look at error and take appropriate action
                            //self.successLabel.text = "Sorry!!... User did not authenticate successfully"
                            print("Sorry!!... User did not authenticate successfully")
                        }
                    }
                }
            } else {
                // Could not evaluate policy; look at authError and present an appropriate message to user
                //successLabel.text = "Sorry!!.. Could not evaluate policy."
                print("Sorry!!.. Could not evaluate policy.")
            }
        } else {
            // Fallback on earlier versions
            
            //successLabel.text = "Ooops!!.. This feature is not supported."
            print("Ooops!!.. This feature is not supported.")
        }
        
        
    }

}
