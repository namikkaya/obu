//
//  extension.swift
//  obu
//
//  Created by namik kaya on 23.01.2019.
//  Copyright © 2019 namik kaya. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}

extension UIViewController {
    /// Boş alana dokunulduğunda klavye kapatılır
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /// NavigationBar title ekler.
    internal func setNavigationBarTitle(titleText:String){
        self.navigationItem.hidesBackButton = true
        let textShadow = NSShadow()
        textShadow.shadowBlurRadius = 2
        textShadow.shadowOffset = CGSize(width: 0.5, height: 0.5)
        textShadow.shadowColor = UIColor.gray
        
        let attrs = [
            NSAttributedString.Key.shadow: textShadow,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Barlow-Regular", size: 17)!
        ]
        
        self.navigationController?.navigationBar.titleTextAttributes = attrs
        self.navigationItem.title = titleText
    }
    
    /// Navigationbar sol button ekler
    internal func setLeftButton(normalType:UIImage, highLightType:UIImage, size:CGFloat)->UIButton {
        let btn1 = UIButton(type: .system)
        btn1.setBackgroundImage(normalType, for: UIControl.State.normal)
        btn1.frame = CGRect(x: 0, y: 0, width: size, height: size)
        btn1.clipsToBounds = true
        btn1.setNeedsLayout()
        let item1 = UIBarButtonItem(customView: btn1)
        let width = item1.customView?.widthAnchor.constraint(equalToConstant: size)
        width?.isActive = true
        let height = item1.customView?.heightAnchor.constraint(equalToConstant: size)
        height?.isActive = true
        self.navigationItem.setLeftBarButton(item1, animated: true)
        return btn1
    }
    
    /// Navigationbar sağ button Ekler
    internal func setRightButton(normalType:UIImage, highLightType:UIImage, size:CGFloat)->UIButton {
        let btn1 = UIButton(type: .system)
        btn1.setBackgroundImage(normalType, for: UIControl.State.normal)
        btn1.frame = CGRect(x: 0, y: 0, width: size, height: size)
        btn1.clipsToBounds = true
        btn1.setNeedsLayout()
        let item1 = UIBarButtonItem(customView: btn1)
        let width = item1.customView?.widthAnchor.constraint(equalToConstant: size)
        width?.isActive = true
        let height = item1.customView?.heightAnchor.constraint(equalToConstant: size)
        height?.isActive = true
        self.navigationItem.setRightBarButton(item1, animated: true)
        return btn1
    }
    
    
}
