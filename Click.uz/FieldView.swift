//
//  FieldView.swift
//  Click.uz
//
//  Created by Admin on 3/3/15.
//  Copyright (c) 2015 Shohin. All rights reserved.
//

import UIKit

//typealias ActionBlock = ()->Void

class FieldView: UIView {
    //var actionBlock : ActionBlock = {}
    var text1 : String {
        get {
            return ""//fieldItem1?.txtField?.text
        }
        set {
            
            //self.text1 = newValue
        }
    }
    var text2 : String {
        get {
            return ""//fieldItem2?.txtField?.text
        }
        set {
            //self.text2 = newValue
        }
    }
    
    var text3 : String {
        get {
            return ""//fieldItem3.txtField.text
        }
        set {
            //self.text3 = newValue
        }
    }
    
    var fieldItem1 : FieldViewItem? = nil
    var fieldItem2 : FieldViewItem? = nil
    var fieldItem3 : FieldViewItem? = nil
    
    init(frame: CGRect, title:String, firstText:String, placeHolders:[String], btnAction:Selector, target:AnyObject, arrowAction:Selector) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        self.clipsToBounds = true
        self.layer.cornerRadius = 10.0
        
        var w = CGRectGetWidth(frame)
        var hHeader = CGFloat(30)
        
        var color = UIColor(red: 39.0 / 255.0, green: 162.0/255.0, blue: 219.0 / 255.0, alpha: 1)
        
        var headerView = UIView(frame: CGRectMake(0, 0, w, hHeader))
        headerView.backgroundColor = color
        var headetTitleLabel = UILabel (frame: headerView.bounds)
        
        headetTitleLabel.text = title
        headetTitleLabel.textAlignment = NSTextAlignment.Center
        headetTitleLabel.font = UIFont(name: "Helvetica Neue", size: 20.0)
        headetTitleLabel.backgroundColor = UIColor.clearColor()
        headetTitleLabel.textColor = UIColor.whiteColor()
        headerView.addSubview(headetTitleLabel)
        
        self.addSubview(headerView)
        
        var distance = CGFloat(10)
        var x = distance
        var y = CGRectGetMaxY(headerView.frame) + distance
        var wF = w - 2 * x
        var hF = hHeader
        for i in 0...2 {
            var fVItem = FieldViewItem(frame: CGRectMake(x, y, wF, hF), title: (i == 0 ? firstText : ""), fieldEnabled: (i == 0 ? false : true), placeHoleder: placeHolders[i], hideArrow: (i == 0 ? false : true), target: target, action: arrowAction)
            if i == 0 {
                fieldItem1 = fVItem
            }
            else if i == 1 {
                fieldItem2 = fVItem
            }
            else if i == 2 {
                fieldItem3 = fVItem
            }
            self.addSubview(fVItem)
            y += (hF + distance)
        }
        
        y += distance
        
        var wBtn = (w - 2 * x - 4 * distance) / 2
        var hBtn = CGFloat(50)
        var frBtn = CGRectMake(x, y, wBtn, hBtn)
   
        var cancelBtn = UIButton (frame: frBtn)
        cancelBtn.backgroundColor = color
        cancelBtn.clipsToBounds = true
        cancelBtn.layer.cornerRadius = 5.0
        cancelBtn.setTitle("Chiqish", forState: UIControlState.Normal)
        cancelBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        cancelBtn.addTarget(self, action: "cancelAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(cancelBtn)
        
        frBtn.origin.x += (wBtn + 4 * distance)
        var payBtn = UIButton (frame: frBtn)
        payBtn.backgroundColor = color
        payBtn.clipsToBounds = true
        payBtn.layer.cornerRadius = 5.0
        payBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        payBtn.setTitle("To`lash", forState: UIControlState.Normal)
        payBtn.addTarget(self, action: btnAction, forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(payBtn)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func showFieldViewOnPopupView(title:String, firstText:String, placeHolders:[String], action:Selector, target:AnyObject, arrowAction:Selector) -> FieldView {
        var window : UIWindow = Constants.APPDELEGATE.window!
        var h = CGFloat(250)
        var y = (CGRectGetHeight(window.frame) - h) / 2
        var x = CGFloat (10)
        var w = CGRectGetWidth(window.frame) - 2 * x
        var fView = FieldView(frame: CGRectMake(x, y, w, h), title: title, firstText: firstText, placeHolders: placeHolders, btnAction:action, target:target, arrowAction: arrowAction)
        fView.text1 = firstText
        PopupView.showPopupView(fView)
        return fView
    }
    
    func cancelAction (sender:UIButton) {
        PopupView.hidePopupView()
    }
    
    
}
