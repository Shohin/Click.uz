//
//  ItemCellBackground.m
//  iAIST
//
//  Created by Shohin on 4/15/14.
//  Copyright (c) 2014 Shohin. All rights reserved.
//

#import "ItemCellBackgroundView.h"

#define ROUND_SIZE 3

@implementation ItemCellBackgroundView

@synthesize borderColor = _borderColor, fillColor = _fillColor, position = _position;

- (BOOL) isOpaque {
    return NO;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(c, [_fillColor CGColor]);
	CGContextSetStrokeColorWithColor(c, [_borderColor CGColor]);
	CGContextSetLineWidth(c, 1.0);
	
	if (_position == ItemCellBackgroundViewPositionTop) {
		
		CGFloat minx = CGRectGetMinX(rect) , midx = CGRectGetMidX(rect), maxx = CGRectGetMaxX(rect) ;
		CGFloat miny = CGRectGetMinY(rect) , maxy = CGRectGetMaxY(rect) ;
		minx = minx + 1;
		miny = miny + 1;
		
		maxx = maxx - 1;
		maxy = maxy;
		
		CGContextMoveToPoint(c, minx, maxy);
		CGContextAddArcToPoint(c, minx, miny, midx, miny, ROUND_SIZE);
		CGContextAddArcToPoint(c, maxx, miny, maxx, maxy, ROUND_SIZE);
		CGContextAddLineToPoint(c, maxx, maxy);
		
		// Close the path
        //		CGContextClosePath(c);
		// Fill & stroke the path
		CGContextDrawPath(c, kCGPathFillStroke);
        
        CGContextSetStrokeColorWithColor(c, [[UIColor clearColor] CGColor]);
        CGContextSetLineWidth(c, 2.0);
        CGContextMoveToPoint(c,  minx + 10.f, maxy);
        CGContextAddLineToPoint(c, maxx - 10.f, maxy);
        
        CGContextStrokePath(c);
        
		return;
	}
	else if (_position == ItemCellBackgroundViewPositionMiddle) {
		
		CGFloat minx = CGRectGetMinX(rect) , maxx = CGRectGetMaxX(rect) ;
		CGFloat miny = CGRectGetMinY(rect) , maxy = CGRectGetMaxY(rect) ;
        //		minx = minx + 1;
		miny = miny;
		
		maxx = maxx - 1;
		maxy = maxy;
		
        //CGContextSetStrokeColorWithColor(c, [colorWithRGB(212.0f, 212.0f, 212.0f) CGColor]);
		CGContextMoveToPoint(c, minx + 1, miny);
		CGContextAddLineToPoint(c, minx + 1, maxy + 1);
		CGContextAddLineToPoint(c, maxx, maxy + 1);
		CGContextAddLineToPoint(c, maxx, miny);
		CGContextAddLineToPoint(c, minx + 1, miny);
		CGContextDrawPath(c, kCGPathFillStroke);
        //		CGContextClosePath(c);
        
        CGContextSetStrokeColorWithColor(c, [_borderColor CGColor]);
		CGContextMoveToPoint(c, minx + 1, miny);
		CGContextAddLineToPoint(c, minx + 1, maxy);
		CGContextMoveToPoint(c, maxx, miny - 1);
		CGContextAddLineToPoint(c, maxx, maxy + 1);
        CGContextStrokePath(c);
        
        CGContextSetStrokeColorWithColor(c, [[UIColor clearColor] CGColor]);
        CGContextSetLineWidth(c, 2.0);
        CGContextMoveToPoint(c,  minx + 10.f, maxy);
        CGContextAddLineToPoint(c, maxx - 10.f, maxy);
        CGContextStrokePath(c);
        
		return;
	}
	
	else if (_position == ItemCellBackgroundViewPositionBottom) {
		
		CGFloat minx = CGRectGetMinX(rect) , midx = CGRectGetMidX(rect), maxx = CGRectGetMaxX(rect) ;
		CGFloat miny = CGRectGetMinY(rect) , maxy = CGRectGetMaxY(rect) ;
		minx = minx + 1;
		miny = miny;
		maxx = maxx - 1;
		maxy = maxy - 1;
        
        //CGContextSetStrokeColorWithColor(c, [colorWithRGB(212.0f, 212.0f, 212.0f) CGColor]);
        CGContextMoveToPoint(c, minx, miny);
		CGContextAddArcToPoint(c, minx, maxy, midx, maxy, ROUND_SIZE);
		CGContextAddArcToPoint(c, maxx, maxy, maxx, miny, ROUND_SIZE);
		CGContextAddLineToPoint(c, maxx, miny);
        CGContextAddLineToPoint(c, minx, miny);
		CGContextDrawPath(c, kCGPathFillStroke);
        //        CGContextClosePath(c);
        
        CGContextSetStrokeColorWithColor(c, [_borderColor CGColor]);
		CGContextMoveToPoint(c, minx, miny);
		CGContextAddArcToPoint(c, minx, maxy, midx, maxy, ROUND_SIZE);
		CGContextAddArcToPoint(c, maxx, maxy, maxx, miny, ROUND_SIZE);
		CGContextAddLineToPoint(c, maxx, miny);
        CGContextStrokePath(c);
        
		return;
	}
	else if (_position == ItemCellBackgroundViewPositionSingle)
	{
		CGFloat minx = CGRectGetMinX(rect) , midx = CGRectGetMidX(rect), maxx = CGRectGetMaxX(rect) ;
		CGFloat miny = CGRectGetMinY(rect) , midy = CGRectGetMidY(rect) , maxy = CGRectGetMaxY(rect) ;
		minx = minx + 1;
		miny = miny + 1;
		
		maxx = maxx - 1;
		maxy = maxy - 1;
		
		CGContextMoveToPoint(c, minx, midy);
		CGContextAddArcToPoint(c, minx, miny, midx, miny, ROUND_SIZE);
		CGContextAddArcToPoint(c, maxx, miny, maxx, midy, ROUND_SIZE);
		CGContextAddArcToPoint(c, maxx, maxy, midx, maxy, ROUND_SIZE);
		CGContextAddArcToPoint(c, minx, maxy, minx, midy, ROUND_SIZE);
		
		// Close the path
		CGContextClosePath(c);
		// Fill & stroke the path
		CGContextDrawPath(c, kCGPathFillStroke);
		return;
	}
}

//static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth, float ovalHeight)
//{
//    float fw, fh;
//	
//    if (ovalWidth == 0 || ovalHeight == 0) {// 1
//        CGContextAddRect(context, rect);
//        return;
//    }
//	
//    CGContextSaveGState(context);// 2
//	
//    CGContextTranslateCTM (context, CGRectGetMinX(rect),// 3
//                           CGRectGetMinY(rect));
//    CGContextScaleCTM (context, ovalWidth, ovalHeight);// 4
//    fw = CGRectGetWidth (rect) / ovalWidth;// 5
//    fh = CGRectGetHeight (rect) / ovalHeight;// 6
//	
//    CGContextMoveToPoint(context, fw, fh/2); // 7
//    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);// 8
//    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1);// 9
//    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1);// 10
//    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // 11
//    CGContextClosePath(context);// 12
//	
//    CGContextRestoreGState(context);// 13
//}

@end
