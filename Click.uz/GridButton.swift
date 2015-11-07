//
//  GridButton.swift
//  Click.uz
//
//  Created by Admin on 3/2/15.
//  Copyright (c) 2015 Shohin. All rights reserved.
//

import UIKit

class GridButton: UIView {

    init(frame: CGRect, title:String, imageName:String, action:Selector, target:AnyObject) {
        super.init(frame: frame);
        let btnSize = CGRectGetWidth(frame)
        let lblH = CGRectGetHeight(frame) - btnSize
        assert(lblH > 0, "GridView Height must be great from Width")
        let lblW = btnSize
        let lblY = btnSize;
        
        var imgView = UIImageView(frame: CGRectMake(0, 0, btnSize, btnSize))
        imgView.image = UIImage(named: imageName)
        self.addSubview(imgView)
        
        var lbl = UILabel(frame: CGRectMake(0, lblY, lblW, lblH))
        lbl.text = title
        lbl.textColor = UIColor.grayColor()
        lbl.textAlignment = NSTextAlignment.Center
        lbl.numberOfLines = 2
        lbl.font = UIFont(name: "Helvetica Neue", size: 15.0)
        self.addSubview(lbl)
        
        var tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tapGesture)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
