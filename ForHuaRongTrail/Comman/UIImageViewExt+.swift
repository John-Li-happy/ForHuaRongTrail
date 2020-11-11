//
//  UIImageViewExt+.swift
//  ForHuaRongTrail
//
//  Created by Zhaoyang Li on 11/8/20.
//

import UIKit

extension UIImageView {
    func blockBasicUISettings() {
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.black.cgColor
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        
        self.layer.borderWidth = 2
        self.layer.masksToBounds = false
    }
}
