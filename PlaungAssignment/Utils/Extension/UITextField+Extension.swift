//
//  UITextField.swift
//  PlaungAssignment
//
//  Created by mac 2019 on 3/3/22.
//

import UIKit

extension UITextField {

    func setUnderLine(borderWidth: CGFloat, color: CGColor) {
        for layer in self.layer.sublayers ?? [] {
            print("Nirob test remove layer")
            layer.removeFromSuperlayer()
        }
        print("Nirob test remove layer end")
        let border = CALayer()
        border.borderColor = color
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func setUnderLine(height: CGFloat, color: UIColor){
        removeUnderLine()
        let bottomLine = UIView()
        bottomLine.tag = 101
        bottomLine.frame = CGRect.init(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: height)
        bottomLine.backgroundColor = color
        self.addSubview(bottomLine)
    }
    
    func removeUnderLine() {
        self.subviews.forEach {
            if $0.tag == 101 {
                $0.removeFromSuperview()
            }
        }
    }
    
    func setLeftPaddingPoints(_ amount: CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
