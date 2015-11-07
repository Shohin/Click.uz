//
//  GridView.swift
//  Click.uz
//
//  Created by Admin on 3/2/15.
//  Copyright (c) 2015 Shohin. All rights reserved.
//

import UIKit

protocol GridViewDelegate : NSObjectProtocol {
    func gridView(gridVew:GridView, didSelectedItemIndex:Int)
}

class GridView: UIView {
    var delegate:GridViewDelegate! = nil
    
    
    init(frame:CGRect, rows:Int, cols:Int, titles:[String], imageNames:[String]){
        super.init(frame: frame)
        
        let w = CGRectGetWidth(frame)
        let h = CGRectGetHeight(frame)
        let r = CGFloat(rows)
        let c = CGFloat (cols)
        
        let wGridItem = CGFloat(90)
        let hGridItem = CGFloat (130)
        var distanceX = (w - c * wGridItem) / (c + 1)
        var distanceY = 2 * distanceX//(h - r * hGridItem) / (r + 1)
        var xGridItem = distanceX
        var yGridItem = distanceX
        
        var count = 0
        
        for  i in 1...rows {
            for j in 1...cols {
                if titles.count > count && imageNames.count > count {
                    var gridItem = GridButton(frame: CGRectMake(xGridItem, yGridItem, wGridItem, hGridItem), title: titles[count], imageName: imageNames[count], action:"itemAction:", target: self)
                    gridItem.tag = ++count
                    self.addSubview(gridItem)
                } else {
                    break
                }
                xGridItem += (wGridItem + distanceX)
            }
            yGridItem += (hGridItem + distanceY)
            xGridItem = distanceX
        }
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func itemAction(sender:UITapGestureRecognizer)
    {
        if(delegate != nil && delegate!.respondsToSelector("gridView:didSelectedItemIndex:"))
        {
            delegate!.gridView(self, didSelectedItemIndex: sender.view!.tag)
        }
    }
}
