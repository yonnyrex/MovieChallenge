//
//  DesignableUITextField.swift
//  MovieChallenge
//
//  Created by Yonny on 8/04/24.
//


import UIKit

protocol DesignableUITextFieldDelegate {
    func pressRightImage()
}

@IBDesignable
class DesignableUITextField: UITextField {
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable dynamic open var placeholderColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0.2196078431, alpha: 0.6539758134) {
        didSet {
            updatePlaceholder()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 10
    @IBInspectable var isPickerType: Bool = false
    @IBInspectable var withShadow: Bool = false
    @IBInspectable var borderC: UIColor = #colorLiteral(red: 0, green: 0.3019607843, blue: 0.9803921569, alpha: 0.2616652397)
    @IBInspectable var withMediumFont: Bool = true
    var delegateDesignable: DesignableUITextFieldDelegate?
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        if action == #selector(UIResponderStandardEditActions.cut(_:)) {
            return false
        }
        if action == #selector(UIResponderStandardEditActions.select(_:)) {
            return false
        }
        if action == #selector(UIResponderStandardEditActions.selectAll(_:)) {
            return false
        }
        if action == #selector(UIResponderStandardEditActions.selectAll(_:)) {
            return false
        }
        if isPickerType {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
    
    override func awakeFromNib() {
        self.textColor = #colorLiteral(red: 0, green: 0, blue: 0.2196078431, alpha: 1)
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = borderC.cgColor
        if withMediumFont {
            self.font = UIFont.init(name: "CeraPro-Medium", size: 15)
        }

        if withShadow {
            self.layer.shadowColor = #colorLiteral(red: 0, green: 0.3019607843, blue: 0.9803921569, alpha: 0.2616652397)
            self.layer.shadowRadius = 6
            self.layer.shadowOpacity = 1
            self.layer.shadowOffset = CGSize.zero
            
        }
        
        self.placeholder = self.placeholder
        updatePlaceholder()
        updateView()
    }
    
    private func updatePlaceholder() {
        guard let placeholder = placeholder else {
            return
        }
        
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                NSAttributedString.Key.foregroundColor: placeholderColor]
        )
        
    }
    
    func updateView() {
        if let image = leftImage {
            let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 40))
            mainView.layer.cornerRadius = 5
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
            view.backgroundColor = .clear
            view.clipsToBounds = true
            mainView.addSubview(view)
            
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 10.0, y: 10.0, width: 20.0, height: 20.0)
            view.addSubview(imageView)
            mainView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(firstResponder(_:))))
            mainView.isUserInteractionEnabled = true
            self.leftViewMode = .always
            self.leftView = mainView
        } else {
            let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 40))
            self.leftViewMode = .always
            self.leftView = mainView
        }
        
        if let image = rightImage {
            let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
            mainView.backgroundColor = .clear
            
            mainView.layer.cornerRadius = 5
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
            view.backgroundColor = .clear
            view.clipsToBounds = true
            mainView.isAccessibilityElement = true
            mainView.addSubview(view)

            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 8.0, y: view.center.y - 6, width: 12.0, height: 12.0)
            view.addSubview(imageView)
            imageView.backgroundColor = .clear
            
            mainView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(firstResponder(_:))))
            mainView.isUserInteractionEnabled = true
            self.rightViewMode = .always
            self.rightView = mainView
        } else {
            let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 40))
            self.rightViewMode = .always
            self.rightView = mainView
        }
        
        guard let placeholder = placeholder else {
            return
            
        }
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                NSAttributedString.Key.foregroundColor: placeholderColor
            ]
        )
    }

    @objc func firstResponder(_ sender: UITapGestureRecognizer) {
        if let _ = self.delegateDesignable {
            self.delegateDesignable?.pressRightImage()
        } else {
            self.becomeFirstResponder()
        }
    }    
}
