//
//  photoPickerNavigation.swift
//  obu
//
//  Created by namik kaya on 2.02.2019.
//  Copyright © 2019 namik kaya. All rights reserved.
//

import UIKit

class photoPickerNavigation: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationBar.barTintColor = UIColor.init(hexString: "2F3C44")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

}
