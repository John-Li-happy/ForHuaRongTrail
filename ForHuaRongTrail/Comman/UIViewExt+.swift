//
//  UIViewExt+.swift
//  ForHuaRongTrail
//
//  Created by Zhaoyang Li on 11/10/20.
//

import UIKit

extension UIView {
    func greenBoarder() {
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 10
//        self.backgroundColor?.setFill()
//        self.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "woodBorder"))
    }
    
    func greenContent() {
//        self.backgroundColor?.setFill()
//        self.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "woodBackGround"))
    }
}
