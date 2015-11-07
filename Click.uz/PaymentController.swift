//
//  PaymentController.swift
//  Click.uz
//
//  Created by Admin on 3/2/15.
//  Copyright (c) 2015 Shohin. All rights reserved.
//

import UIKit


enum PaymentType : Int {
    case MobileCommunication = 1, SarcorTelecom, Comnet, TPS, Evo, RegName, UZDigital, StarsTV, TorgUZ, DumpUz, WebTvUz,KinoProUZ, MediaBayUZ, MegaSkidkaUZ, OdnoklassnikiRU, FIFAUz, AvtechUZ, AvenueParkUZ, AlskomUZ, ComboUZ, GosuslugiUZ, UsnifateUZ
}

class PaymentController: UIViewController, GridViewDelegate, ItemPanelDelegate {
    var pType : PaymentType = PaymentType.MobileCommunication
    var fieldView : FieldView? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let gridView = GridView(frame: CGRectMake(0, 80, self.view.bounds.size.width, self.view.bounds.size.height), rows: 2, cols: 3, titles: ["Mobil aloqa","Internet", "Web sayt", "Televideniya", "Kommunal"], imageNames: ["mobile_communication.png", "internet_connection.png", "web_pay.png", "tv_pay.png", "communale_pay.png"])
        gridView.delegate = self
        self.view .addSubview(gridView)
    }
    
    func ussdAction (index : Int){
        
        if index == 5 {
            var ussdUrlStr : String = "tel://";
            ussdUrlStr += ClickModel.communalePayUSSDUrl
            println(ussdUrlStr)
            let ussdUrl = NSURL(string: ussdUrlStr)
            UIApplication.sharedApplication().openURL(ussdUrl!)
        } else {
            showPopup(index)
        }
        
    }
    func gridView(gridVew: GridView, didSelectedItemIndex: Int) {
        ussdAction(didSelectedItemIndex)
    }
    
    func showPopup(let index : Int) {
        var title : String = ""
        var firstText : String = ""
        var placeHolders : [String] = []
        switch index {
        case 1 :
            title = "Mobil Aloqa"
            firstText = ClickModel.mobileOperators[0]
            placeHolders = ["", "XXXXXXX", "Summasi"]
            pType = PaymentType.MobileCommunication
        case 2 :
            title = "Internetga to`lash"
            firstText = ClickModel.internetProvides[0]
            placeHolders = ["", "login", "Summasi"]
            pType = PaymentType.SarcorTelecom
        case 3 :
            title = "Web sahifa"
            firstText = ClickModel.saytes[0]
            placeHolders = ["", "login", "Summasi"]
            pType = PaymentType.TorgUZ
        case 4 :
            title = "TVga to`lov"
            firstText = ClickModel.tvs[0]
            placeHolders = ["", "ID abonent", "Summasi"]
            pType = PaymentType.UZDigital
        default :
            title = ""
            firstText = ""
            placeHolders = []
        }
        fieldView = FieldView.showFieldViewOnPopupView(title, firstText: firstText, placeHolders: placeHolders, action: "paymentByPaymentType", target: self, arrowAction: "showPopupView")
    }
    
    func paymentByPaymentType() {
        var ussdUrlStr : String = "tel://";
        println(ussdUrlStr)
        let txt1 = fieldView?.text1
        var txt2 = fieldView?.text2
        switch pType {
        case PaymentType.MobileCommunication :
            ussdUrlStr += ClickModel.mobilePayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.SarcorTelecom :
            ussdUrlStr += ClickModel.sarkorTelekomProviderPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.Comnet:
            ussdUrlStr += ClickModel.comnetProviderPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.TPS :
            ussdUrlStr += ClickModel.tpsProviderPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.Evo :
            ussdUrlStr += ClickModel.evoProviderPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.RegName :
            ussdUrlStr += ClickModel.regnameProviderPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.UZDigital :
            ussdUrlStr += ClickModel.usDigitalTVPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.StarsTV :
            ussdUrlStr += ClickModel.starsTVPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.TorgUZ :
            ussdUrlStr += ClickModel.torgUZPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.DumpUz :
            ussdUrlStr += ClickModel.dumpUZPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.WebTvUz :
            ussdUrlStr += ClickModel.webtvUZPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.KinoProUZ :
            ussdUrlStr += ClickModel.kinoproUZPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.MediaBayUZ :
            ussdUrlStr += ClickModel.mediabayUZPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.MegaSkidkaUZ :
            ussdUrlStr += ClickModel.megaskidkaUZPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.OdnoklassnikiRU :
            ussdUrlStr += ClickModel.odnoklassnikiRUPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.FIFAUz :
            ussdUrlStr += ClickModel.fifaUZPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.AvtechUZ :
            ussdUrlStr += ClickModel.avtechUZPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.AvenueParkUZ :
            ussdUrlStr += ClickModel.avenueParkUZPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.AlskomUZ :
            ussdUrlStr += ClickModel.alskomUZPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.ComboUZ :
            ussdUrlStr += ClickModel.comboUZPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.GosuslugiUZ :
            ussdUrlStr += ClickModel.gosuslugiUZPayUSSDUrl(txt1!, price: txt2!)
        case PaymentType.UsnifateUZ :
            ussdUrlStr += ClickModel.usnifateUZPayUSSDUrl(txt1!, price: txt2!)
        default:
            ussdUrlStr = "default"
        }
        
        let ussdUrl = NSURL(string: ussdUrlStr)
        UIApplication.sharedApplication().openURL(ussdUrl!)
    }
    
    func showPopupView (){
        var itemPanel : ItemPanel = ItemPanel();
        itemPanel.delegate = self
        itemPanel.itemPanelType = ItemPanelTypeRadioGroup
        var items : [String] = []
        switch pType {
        case PaymentType.MobileCommunication:
            println("mobil")
            items = ClickModel.mobileOperators
        case PaymentType.SarcorTelecom, PaymentType.Comnet, PaymentType.TPS, PaymentType.Evo, PaymentType.RegName:
            println("provider")
            items = ClickModel.internetProvides
        case PaymentType.UZDigital, PaymentType.StarsTV:
            println("tv")
            items = ClickModel.tvs
        case PaymentType.TorgUZ, PaymentType.DumpUz, PaymentType.WebTvUz,PaymentType.KinoProUZ, PaymentType.MediaBayUZ, PaymentType.MegaSkidkaUZ, PaymentType.OdnoklassnikiRU, PaymentType.FIFAUz, PaymentType.AvtechUZ, PaymentType.AvenueParkUZ, PaymentType.AlskomUZ, PaymentType.ComboUZ, PaymentType.GosuslugiUZ, PaymentType.UsnifateUZ:
            println("siytes")
            items = ClickModel.saytes
        default:
            println("showed")
        }
        itemPanel.selectedItem = fieldView?.text1
        itemPanel.items = items
        itemPanel.presentPanelItem()
    }
    
    func panel(panel: ItemPanel!, didSelectAtIndexPath indexPath: NSIndexPath!, withObject obj: AnyObject!) {
        var index = indexPath.row
        var startIndex = 1
        switch pType {
        case PaymentType.MobileCommunication:
            startIndex = 1
        case PaymentType.SarcorTelecom, PaymentType.Comnet, PaymentType.TPS, PaymentType.Evo, PaymentType.RegName:
            startIndex = 2
        case PaymentType.UZDigital, PaymentType.StarsTV:
            startIndex = 7
        case PaymentType.TorgUZ, PaymentType.DumpUz, PaymentType.WebTvUz,PaymentType.KinoProUZ, PaymentType.MediaBayUZ, PaymentType.MegaSkidkaUZ, PaymentType.OdnoklassnikiRU, PaymentType.FIFAUz, PaymentType.AvtechUZ, PaymentType.AvenueParkUZ, PaymentType.AlskomUZ, PaymentType.ComboUZ, PaymentType.GosuslugiUZ, PaymentType.UsnifateUZ:
            startIndex = 9
        default:
            println("showed")
        }
        pType = PaymentType(rawValue: startIndex + index)!
        if startIndex == 1 {
            pType = PaymentType.MobileCommunication
        }
        
        paymentByPaymentType()
        
    }
    
    func panelDismissed() {
        
    }
}
