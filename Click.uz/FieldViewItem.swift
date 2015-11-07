//
//  FieldViewItem.swift
//  Click.uz
//
//  Created by Admin on 3/3/15.
//  Copyright (c) 2015 Shohin. All rights reserved.
//

import UIKit

class FieldViewItem: UIView, UITextFieldDelegate {

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var txtField : UITextField? = nil
    var arrowImgView : UIImageView? = nil
    
    init(frame: CGRect, title:String, fieldEnabled:Bool, placeHoleder:String, hideArrow:Bool, target:AnyObject, action:Selector) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.layer.borderWidth = 0.5
        
        let sizeArrowImg = CGRectGetHeight(frame)
        let wTxtField = CGRectGetWidth(frame) - sizeArrowImg
        let h = CGRectGetHeight(frame)
        
        
        txtField = UITextField(frame: CGRectMake(0, 0, wTxtField, h))
        txtField?.text = title
        txtField?.delegate = self
        txtField?.enabled = fieldEnabled
        txtField?.placeholder = placeHoleder
        txtField?.font = UIFont(name: "Helvetic Neue", size: 25.0)
        self.addSubview(txtField!)
        
        if !hideArrow {
            arrowImgView = UIImageView(frame: CGRectMake(wTxtField, 0, sizeArrowImg, sizeArrowImg))
            arrowImgView?.image = UIImage(named: "arrow.png")
            self.addSubview(arrowImgView!)
            
            self.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
        }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        txtField?.resignFirstResponder()
        return true
    }
    
}
