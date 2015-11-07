//
//  PopupView.swift
//  Click.uz
//
//  Created by Admin on 3/3/15.
//  Copyright (c) 2015 Shohin. All rights reserved.
//

import UIKit

class PopupView: UIView {
    class func showPopupView (subView:UIView)->PopupView {
        var window : UIWindow = Constants.APPDELEGATE.window!
        var popupV = PopupView(frame: window.bounds)
        popupV.backgroundColor = UIColor.clearColor()
        popupV.tag = 1001
        
        var bgView = UIView(frame: popupV.bounds)
        bgView.backgroundColor = UIColor.blackColor()
        bgView.alpha = 0.4
        popupV.addSubview(bgView)
        
        popupV.addSubview(subView)
        
        window.addSubview(popupV)
        return popupV
    }
    
    class func hidePopupView () {
        var window : UIWindow = Constants.APPDELEGATE.window!
        window.viewWithTag(1001)?.removeFromSuperview()
    }
}
