//
//  inputTextView.swift
//  obu
//
//  Created by namik kaya on 6.01.2019.
//  Copyright © 2019 namik kaya. All rights reserved.
//

import UIKit

@IBDesignable
class inputTextView: UIView, UITextFieldDelegate {
    private var view:UIView!
    private var nibName:String = "inputTextView"
    
    //- obj
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var animationBottomView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        view.clipsToBounds = true
        addSubview(view)
        
        textViewConfig()
    }
    
    func loadViewFromNib()-> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    func textViewConfig() {
        inputText.delegate = self
        inputText.text = placeHolder
        inputText.textColor = textColor
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == placeHolder {
            textField.text = nil
            textField.textColor = textColor
            animationBottomView.backgroundColor = bottomViewSelectedColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text!.isEmpty {
            textField.text = placeHolder
            textField.textColor = placeHolderColor
            animationBottomView.backgroundColor = bottomViewNormalColor
        }
    }
    
    private var placeHolderHold:String = ""
    @IBInspectable
    var placeHolder:String {
        set{
            placeHolderHold = newValue
            inputText.text = placeHolderHold
        }get{
            return placeHolderHold
        }
    }
    
    private var placeHolderColorHolder:UIColor = UIColor.lightGray
    @IBInspectable
    var placeHolderColor:UIColor {
        set {
            placeHolderColorHolder = newValue
            inputText.textColor = placeHolderColorHolder
        }get{
            return placeHolderColorHolder
        }
    }
    
    private var textColorHolder:UIColor = UIColor.black
    @IBInspectable
    var textColor:UIColor {
        set {
            textColorHolder = newValue
        }get{
            return placeHolderColorHolder
        }
    }
   
    
    private var bottomViewNormalColorHolder:UIColor = UIColor.lightGray
    @IBInspectable
    var bottomViewNormalColor:UIColor {
        set {
            animationBottomView.backgroundColor = newValue
            bottomViewNormalColorHolder = newValue
        }get{
            return bottomViewNormalColorHolder
        }
    }
    
    private var bottomViewSelectedColorHolder:UIColor = UIColor.red
    @IBInspectable
    var bottomViewSelectedColor:UIColor {
        set {
            bottomViewSelectedColorHolder = newValue
        }get{
            return bottomViewSelectedColorHolder
        }
    }
    
    
}
