//
//  photoAlbumCollectionCell.swift
//  obu
//
//  Created by namik kaya on 10.02.2019.
//  Copyright © 2019 namik kaya. All rights reserved.
//

import UIKit

class photoAlbumCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var checkImageView: UIImageView!
    @IBOutlet var colorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        colorView.isHidden = true
    }
    
    private var checkHolder:Bool = false
    var check:Bool {
        set{
            checkHolder = newValue
            if (checkHolder) {
                let image = UIImage(named: "check")
                checkImageView.image = image
                checkImageView.contentMode = .scaleAspectFit
                colorView.isHidden = false
                
                UIView.animate(withDuration: 0.01) {
                    self.colorView.alpha = 0.0
                    self.checkImageView.alpha = 0.0
                    self.checkImageView.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
                }
                

                
                UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                    self.colorView.alpha = 1
                    self.checkImageView.alpha = 1
                    self.checkImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                }) { _ in
                    
                }
                
            }else{
                let image = UIImage()
                
                
                
                UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                    self.colorView.alpha = 0.0
                    self.checkImageView.alpha = 0.0
                    self.checkImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                }) { _ in
                    self.colorView.isHidden = true
                    self.checkImageView.image = image
                    self.checkImageView.contentMode = .scaleAspectFit
                    UIView.animate(withDuration: 0.01) {
                        self.colorView.alpha = 0.0
                        self.checkImageView.alpha = 0.0
                        self.checkImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    }
                }
                
            }
        }get{
            return checkHolder
        }
    }
}
