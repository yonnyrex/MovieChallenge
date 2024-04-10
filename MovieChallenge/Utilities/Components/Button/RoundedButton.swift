//
//  RoundedButton.swift
//  MovieChallenge
//
//  Created by Yonny on 8/04/24.
//


import Foundation
import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable var resizeWidth: Bool = false
    @IBInspectable var withShadow: Bool = false
    @IBInspectable var widthShadow: CGFloat = 2.0
    @IBInspectable var heightShadow: CGFloat = 2.0
    @IBInspectable var backGColor: UIColor = #colorLiteral(red: 0, green: 0.3019607843, blue: 0.9803921569, alpha: 1)
    @IBInspectable var borderColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
    @IBInspectable var isActive: Bool = true {
        didSet {
            updateBackgroundColor()
        }
    }
    
    var isMode: Bool = false {
        didSet {
            updateModeButton()
        }
    }
    
    override func awakeFromNib() {
        DispatchQueue.main.async {
            self.titleLabel?.adjustsFontSizeToFitWidth = true
            self.layoutIfNeeded()
            self.layer.cornerRadius = 10
            self.layer.borderColor = self.borderColor.cgColor
            self.layer.borderWidth = 1
            //translate
            self.setTitle(self.titleLabel?.text ?? "", for: .normal)
        
            if self.resizeWidth {
                self.titleLabel?.minimumScaleFactor = 0.5
                self.titleLabel?.adjustsFontSizeToFitWidth = true
            }
            if self.withShadow {
                self.layer.shadowColor = #colorLiteral(red: 0, green: 0.3019607843, blue: 0.9803921569, alpha: 0.2616652397)
                self.layer.shadowRadius = 3
                self.layer.shadowOpacity = 0.8
                self.layer.shadowOffset = CGSize(width: self.widthShadow, height: self.heightShadow)
            }
            self.updateBackgroundColor()
        }
    }
    
    private func updateBackgroundColor() {
        //#colorLiteral(red: 0, green: 0.3019607843, blue: 0.9803921569, alpha: 0.2649293664)
        self.backgroundColor = isActive ? backGColor : backGColor.withAlphaComponent(0.26)
        self.isEnabled = isActive
    }
    
    private func updateModeButton() {
        self.backgroundColor = isMode ? UIColor.init(named: "colorPrimary") : UIColor.clear
        self.setTitleColor(isMode ? UIColor.white : UIColor.init(named: "colorPrimary"), for: .normal)
    }
    
}
