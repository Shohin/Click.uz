//
//  RegistrationView.swift
//  Click.uz
//
//  Created by Admin on 5/28/15.
//  Copyright (c) 2015 Shohin. All rights reserved.
//

import UIKit

class RegistrationViewController : UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var color = UIColor(red: 39.0 / 255.0, green: 162.0/255.0, blue: 219.0 / 255.0, alpha: 1)
        
        self.view.backgroundColor = UIColor.whiteColor()
        var left : CGFloat = 10
        var cardTitleLbl = UILabel(frame: CGRectMake(left, 100, 300, 30))
        cardTitleLbl.text = "SIZNING KARTANGIZ"
        self.view.addSubview(cardTitleLbl)
        
        var examFrame = cardTitleLbl.frame
        
        var cardField = UITextField(frame: CGRectMake(left, CGRectGetMaxY(examFrame) + 10, CGRectGetWidth(examFrame), 40))
        cardField.placeholder = "8600 XXXX XXXX XXXX"
        cardField.textAlignment = NSTextAlignment.Center
        cardField.delegate = self
        cardField.borderStyle = UITextBorderStyle.Line
        self.view.addSubview(cardField)
        
        var cardDescLbl = UILabel(frame: CGRectMake(left, CGRectGetMaxY(cardField.frame), CGRectGetWidth(examFrame), 20))
        cardDescLbl.text = "Online kartangiz nomerini kiriting"
        cardDescLbl.font = UIFont.systemFontOfSize(12)
        self.view.addSubview(cardDescLbl)
        
        var telTileLbl = UILabel(frame: CGRectMake(left, CGRectGetMaxY(cardDescLbl.frame) + 20, CGRectGetWidth(examFrame), 30))
        telTileLbl.text = "ESKI TELEFON NOMERINGIZ"
        self.view.addSubview(telTileLbl)
        
        var telField = UITextField(frame: CGRectMake(left, CGRectGetMaxY(telTileLbl.frame), CGRectGetWidth(examFrame), 40))
        telField.placeholder = "+998 XX XXX-XX-XX"
        telField.borderStyle = UITextBorderStyle.Line
        telField.delegate = self
        self.view.addSubview(telField)
        
        var w : CGFloat = 100
        var window : UIWindow = Constants.APPDELEGATE.window!
        var continueBtn = UIButton(frame: CGRectMake(0, CGRectGetMaxY(telField.frame) + 30, CGRectGetWidth(window.frame), 50))
        continueBtn.setTitle("DAVOM ETTIRISH", forState: UIControlState.Normal)
        continueBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        continueBtn.backgroundColor = color
        self.view.addSubview(continueBtn)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
