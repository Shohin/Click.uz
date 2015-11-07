//
//  ClickModel.swift
//  Click.uz
//
//  Created by Admin on 2/28/15.
//  Copyright (c) 2015 Shohin. All rights reserved.
//

import Foundation

class ClickModel {
    
    class var baseUSSDUrl : String {
        return "*880#"
    }
    class var paymentUSSDUrl : String {
        return "*880*01#"
    }
    class var transferUSSDUrl : String {
        return "*880*02#"
    }
    class var balanceUSSDUrl : String {
        return "*880*03#"
    }
    class var informationUSSDUrl : String {
        return "*880*04#"
    }
    class var settingsUSSDUrl : String {
        return "*880*05#"
    }
    class var webUrl : String {
        return "http://www.click.uz"
    }
    //payment ussd urls
    class func mobilePayUSSDUrl(phoneNum:String, price:String)->String{
        return "*880*01*\(phoneNum)*\(price)#"
    }
    
    class func sarkorTelekomProviderPayUSSDUrl(continueLogin:String, price:String)->String{
        return "*880*07*1*\(continueLogin)*\(price)#"
    }
    
    class func comnetProviderPayUSSDUrl(continueLogin:String, price:String)->String{
        return "*880*04*0*\(continueLogin)*\(price)#"
    }
    
    class func tpsProviderPayUSSDUrl(continueLogin:String, price:String)->String{
        return "*880*031*1*\(continueLogin)*\(price)#"
    }
    
    class func evoProviderPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*045*\(idAbon)*\(price)#"
    }
    
    class func regnameProviderPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*054*\(idAbon)*\(price)#"
    }
    
    //tv
    class func usDigitalTVPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*028*\(idAbon)*\(price)#"
    }
    
    class func starsTVPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*029*\(idAbon)*\(price)#"
    }
    
    //saytlar
    class func torgUZPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*012*\(idAbon)*\(price)#"
    }
    
    class func dumpUZPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*080*\(idAbon)*\(price)#"
    }
    
    class func webtvUZPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*052*\(idAbon)*\(price)#"
    }
    
    class func kinoproUZPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*057*\(idAbon)*\(price)#"
    }
    
    class func mediabayUZPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*070*\(idAbon)*\(price)#"
    }
    
    class func megaskidkaUZPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*013*\(idAbon)*\(price)#"
    }
    
    class func odnoklassnikiRUPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*016*\(idAbon)*\(price)#"
    }
    
    class func fifaUZPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*087*\(idAbon)*\(price)#"
    }
    
    class func avtechUZPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*047*\(idAbon)*\(price)#"
    }
    
    class func avenueParkUZPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*072*\(idAbon)*\(price)#"
    }
    
    class func alskomUZPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*075*\(idAbon)*\(price)#"
    }
    
    class func comboUZPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*066*\(idAbon)*\(price)#"
    }
    
    class func gosuslugiUZPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*050*\(idAbon)*\(price)#"
    }
    
    class func usnifateUZPayUSSDUrl(idAbon:String, price:String)->String{
        return "*880*082*\(idAbon)*\(price)#"
    }
    
    class var internetProvidesPayUSSDUrl : String {
        return "*880*1*2#"
    }
    class var webSitePayUSSDUrl : String {
        return "*880*1*3#"
    }
    class var tvPayUSSDUrl : String {
        return "*880*1*4#"
    }
    class var communalePayUSSDUrl : String {
        return "*880*1*5#"
    }
    
    //settings ussd urls
    class var changePinUSSDUrl : String {
        return "*880*5*1#"
    }
    class var changeLanUSSDUrl : String {
        return "*880*5*2#"
    }
    class var accountUSSDUrl : String {
        return "*880*5*3#"
    }
    class var smsServiceUSSDUrl : String {
        return "*880*5*4#"
    }
    class var smsInfoUSSDUrl : String {
        return "*880*5*5#"
    }
    
    class var mobileOperators : [String] {
        return ["+99893", "+99894", "+99890", "+99891", "+99895"]
    }
    
    class var internetProvides : [String] {
        return ["Sarkor Telekom", "Comnet", "TPS", "Evo", "Regname"]
    }
    class var tvs : [String] {
        return ["UzDigitalTV", "StarsTV"]
    }
    class var saytes : [String] {
        return ["Torg.uz", "Dump.uz", "Webtv.uz", "Kinopro.uz", "Mediabay.uz", "Megaskidka.uz", "Odnoklassniki.ru", "Fifa.uz", "Avtech.uz", "Avenuepark.uz", "Alskom.uz", "Combo.uz", "Gosuslugi.uz", "Usnifate.uz"]
    }
}