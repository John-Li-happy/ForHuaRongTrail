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
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let botConstraint = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: imageView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: imageView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
        imageView.image = UIImage(imageLiteralResourceName: "woodBorder")
        imageView.contentMode = .scaleToFill
        self.addSubview(imageView)

        self.addConstraint(topConstraint)
        self.addConstraint(botConstraint)
        self.addConstraint(leftConstraint)
        self.addConstraint(rightConstraint)
    }
    
    func greenContent() {
        self.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "woodBackGround"))
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 10
    }
    
    func backGroundImage() {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        
        imageView.image = UIImage(imageLiteralResourceName: "backGround")
        imageView.layer.zPosition = -99
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let botConstraint = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: imageView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: imageView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
        imageView.contentMode = .scaleToFill
        self.addSubview(imageView)
        self.addConstraint(topConstraint)
        self.addConstraint(botConstraint)
        self.addConstraint(leftConstraint)
        self.addConstraint(rightConstraint)

    }
}
