//
//  ViewController.swift
//  Click.uz
//
//  Created by Admin on 3/1/15.
//  Copyright (c) 2015 Shohin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GridViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var bgImgView = UIImageView(frame: self.view.bounds)
//        bgImgView.image = UIImage(named:"bg.png")
//        self.view.addSubview(bgImgView)
        
        
        let gridView = GridView(frame: CGRectMake(0, 80, self.view.bounds.size.width, self.view.bounds.size.height), rows: 2, cols: 3, titles: ["To`lovlar","O`tkazmalar", "Hisob", "Ro`yxatdan o`tish", "Ma`lumot", "Sozlanmalar", "Havola"], imageNames: ["payment_icon.png", "transfer_icon.png", "balance_icon.png", "registration.png", "information_icon.png", "settings_icon.png", "web_icon.png"])
        gridView.delegate = self
        self.view .addSubview(gridView)
        
        var navLogoImgView = UIImageView(frame: CGRectMake(0, 0, 320, 50))
        navLogoImgView.image = UIImage(named:"logo.png")
        navLogoImgView.contentMode = UIViewContentMode.Center
        self.navigationController?.navigationBar.addSubview(navLogoImgView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func ussdAction (index : Int){
        var ussdUrlStr : String = "tel://";
        
        var isCanOpen = true

        switch index {
            case 1:
                isCanOpen = false
                pushPamentController()
            //ussdUrlStr += ClickModel.paymentUSSDUrl
            case 2: ussdUrlStr += ClickModel.transferUSSDUrl
            case 3: ussdUrlStr += ClickModel.balanceUSSDUrl
            case 4: isCanOpen = false
                self.showRegistrationView()
            case 5:
                ussdUrlStr += ClickModel.informationUSSDUrl
            //ussdUrlStr += ClickModel.settingsUSSDUrl
            case 6: isCanOpen = false
                pushSettingsController()//ussdUrlStr = ClickModel.webUrl
        default:
            break
        }
        if isCanOpen {
            println(ussdUrlStr)
            let ussdUrl = NSURL(string: ussdUrlStr)
            UIApplication.sharedApplication().openURL(ussdUrl!)
        }
    }
    
    func pushPamentController () {
        var paymentCon = PaymentController()
        self.navigationController?.pushViewController(paymentCon, animated: true)
    }
    
    func pushSettingsController () {
        var settingsCon = SettingsController()
        self.navigationController?.pushViewController(settingsCon, animated: true)
    }
    
    func gridView(gridVew: GridView, didSelectedItemIndex: Int) {
        ussdAction(didSelectedItemIndex)
    }
    
    func showRegistrationView () {
        var window : UIWindow = Constants.APPDELEGATE.window!
        var regView = RegistrationViewController()
        self.navigationController?.pushViewController(regView, animated: true)
    }
    
}

