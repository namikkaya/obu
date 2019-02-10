//
//  toogleButton.swift
//  obu
//
//  Created by namik kaya on 20.01.2019.
//  Copyright © 2019 namik kaya. All rights reserved.
//

import UIKit

class toogleButton: UIButton {
    var isOn:Bool = false
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
        initButton()
    }
    
    func initButton() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        self.backgroundColor = UIColor.blue
        
        self.addTarget(self, action: #selector(toogleButton.buttonPressed), for: UIControl.Event.touchUpInside)
    }
    
    @objc func buttonPressed(){
        activeButton(bool: !isOn)
    }
    
    func activeButton(bool:Bool) {
        isOn = bool
        if isOn {
            layer.borderColor = UIColor.blue.cgColor
            self.backgroundColor = UIColor.green
        }else{
            layer.borderColor = UIColor.white.cgColor
            self.backgroundColor = UIColor.blue
        }
        print("activeButton: status : \(bool)")
    }
}
