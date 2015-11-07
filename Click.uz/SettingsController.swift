//
//  SettingsController.swift
//  Click.uz
//
//  Created by Admin on 3/2/15.
//  Copyright (c) 2015 Shohin. All rights reserved.
//

import UIKit

class SettingsController: UIViewController, GridViewDelegate {
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        let gridView = GridView(frame: CGRectMake(0, 80, self.view.bounds.size.width, self.view.bounds.size.height), rows: 2, cols: 3, titles: ["PINni o`zgartirish","Tilni o`zgartirish", "Hisob", "SMS xizmati", "SMS ma`lumot"], imageNames: ["change_pin.png", "lang.png", "account.png", "SMS-icon.png", "sms_inform.png"])
        gridView.delegate = self
        self.view .addSubview(gridView)
    }
    
    func ussdAction (index : Int){
        var ussdUrlStr : String = "tel://";
        
        switch index {
        case 1:ussdUrlStr += ClickModel.changePinUSSDUrl
        case 2: ussdUrlStr += ClickModel.changeLanUSSDUrl
        case 3: ussdUrlStr += ClickModel.accountUSSDUrl
        case 4: ussdUrlStr += ClickModel.smsServiceUSSDUrl
        case 5:ussdUrlStr += ClickModel.smsInfoUSSDUrl
        default:
            break
        }
        println(ussdUrlStr)
        let ussdUrl = NSURL(string: ussdUrlStr)
        UIApplication.sharedApplication().openURL(ussdUrl!)
    }
    
    func gridView(gridVew: GridView, didSelectedItemIndex: Int) {
        ussdAction(didSelectedItemIndex)
    }
}
