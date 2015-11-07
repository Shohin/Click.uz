//
//  ItemCellBackground.h
//  iAIST
//
//  Created by Shohin on 4/15/14.
//  Copyright (c) 2014 Shohin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum  {
    ItemCellBackgroundViewPositionTop,
    ItemCellBackgroundViewPositionMiddle,
    ItemCellBackgroundViewPositionBottom,
    ItemCellBackgroundViewPositionSingle
} ItemCellBackgroundViewPosition;

@interface ItemCellBackgroundView : UIView

@property(nonatomic, strong) UIColor *borderColor, *fillColor;
@property(nonatomic, assign) ItemCellBackgroundViewPosition position;

//static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,float     ovalHeight);

@end
