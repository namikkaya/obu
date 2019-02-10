//
//  potatoButton.swift
//  obu
//
//  Created by namik kaya on 16.01.2019.
//  Copyright © 2019 namik kaya. All rights reserved.
//

import UIKit


@IBDesignable class potatoButton: UIView {
    private var view:UIView!
    private var nibName:String = "potatoButton"
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleText: UILabel!
    
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
        
        self.layer.masksToBounds = true
        
        bgView.layer.shadowColor = UIColor.white.cgColor
        bgView.layer.shadowOpacity = 1
        bgView.layer.shadowOffset = CGSize.zero
        bgView.layer.shadowRadius = 10
    }
    
    func loadViewFromNib()-> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let _ = touch.location(in: self)
            bgView.backgroundColor = buttonBgClickColor
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self)
            if (currentPoint.x >= 0 && currentPoint.x <= self.frame.size.width && currentPoint.y >= 0 && currentPoint.y <= self.frame.size.height) {
                //print("İşlem yap")
                animationView(p: currentPoint)
            }
            bgView.backgroundColor = buttonBgColor
        }
    }
    
    private func animationView(p:CGPoint) {
        let view = UIView(frame: CGRect(x: p.x-10, y: p.y-10, width: 20, height: 20))
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.backgroundColor = clickAnimationColor
        view.alpha = 0.5
        self.addSubview(view)

        UIView.animate(withDuration: 0.6, animations: {
            view.transform = CGAffineTransform(scaleX: 10, y: 10)
            view.alpha = 0
        }) { (_) in
            view.removeFromSuperview()
        }
    }
    
    private var buttonBgColorHolder:UIColor = UIColor.blue
    @IBInspectable
    var buttonBgColor:UIColor {
        set{
            buttonBgColorHolder = newValue
            bgView.backgroundColor = newValue
        }get{
            return buttonBgColorHolder
        }
    }
    
    private var buttonBgClickColorHolder:UIColor = UIColor.lightGray
    @IBInspectable
    var buttonBgClickColor:UIColor {
        set{
            buttonBgClickColorHolder = newValue
        }get{
            return buttonBgClickColorHolder
        }
    }
    
    private var clickAnimationColorHolder:UIColor = UIColor.red
    @IBInspectable
    var clickAnimationColor:UIColor {
        set{
            clickAnimationColorHolder = newValue
        }get{
            return clickAnimationColorHolder
        }
    }
    
    @IBInspectable
    var label:String? {
        set{
            titleText.text = newValue
        }get{
            return titleText.text
        }
    }
    
    @IBInspectable
    var textColor:UIColor? {
        set{
            titleText.textColor = newValue
        }get{
            return titleText.textColor
        }
    }
    
    @IBInspectable
    var cornerValue:CGFloat{
        set{
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }get{
            return self.layer.cornerRadius
        }
    }
    
    
    
}
