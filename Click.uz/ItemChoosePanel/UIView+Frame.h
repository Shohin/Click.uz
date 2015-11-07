//
//  UIView+Frame.h
//  iMessenger
//
//  Created by Shohin on 5/25/14.
//  Copyright (c) 2014 Messenger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (ObjectTag)
@property (nonatomic, strong) id objectTag;
-(UIView*)viewWithObjectTag:(id)object;
@end

@interface UIView (Frame)

@property CGPoint position;
@property CGFloat x;
@property CGFloat y;
@property CGSize size;
@property CGFloat width;
@property CGFloat height;
@property (readonly) CGFloat relativeWidth;
@property (readonly) CGFloat relativeHeight;
@property CGPoint anchorPoint;
@property CGSize scale;
@property CGFloat rotation;
@property CGPoint translation;
-(void)setOrigin:(CGPoint)aPoint;
-(void)setOriginY:(float)value;
-(void)setOriginX:(float)value;
-(void)setSize:(CGSize)aSize;
-(void)setSizeWidth:(float)value;
-(void)setSizeHeight:(float)value;
-(void)setScale:(CGSize)scale;
-(void)setRotation:(CGFloat)rotation;
-(CGRect) convertFrameToView:(UIView *)toView;


@end

@interface UIView (Utility)
-(void) addSubviews:(UIView*)view, ... NS_REQUIRES_NIL_TERMINATION;
-(void)removeAllSubviews;
-(void)removeAllSubviewsRecursively;
-(UIView*)findFirstResponder;
-(UIView*)findFirstResponderRecursively;
-(UIView*)topSubview;
-(void) deselectAllButtons;
@end

@interface UIView (GestureRecognizer)
-(void) removeAllGestureRecognizers;
-(UITapGestureRecognizer *) addTapGestureRecognizerWithTarget:(id)target selector:(SEL)aSelector;
@end

@interface UIView (Debug)
@property BOOL debugMode;
@property (nonatomic, strong) UIColor *debugColor;
@end

@interface UIView (Image)
-(UIImage *) imageOfView;
@end
