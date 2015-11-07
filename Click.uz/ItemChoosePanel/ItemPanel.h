//
//  ItemPanel.h
//  iAIST
//
//  Created by Shohin on 4/15/14.
//  Copyright (c) 2014 Shohin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemPopupBackgroundView.h"
#import "UIView+Frame.h"

typedef enum {
    ItemPanelTypeNone = 0,
    ItemPanelTypeCheckbox,
    ItemPanelTypeRadioGroup
}ItemPanelType;

typedef enum {
    ItemPopupViewAnimationSlideBottomTop = 1,
    ItemPopupViewAnimationSlideRightLeft,
    ItemPopupViewAnimationSlideLeftRight,
    ItemPopupViewAnimationSlideBottomBottom,
    ItemPopupViewAnimationFade
} ItemPopupViewAnimation;

typedef enum {
    ItemPopupViewPositionCenter = 1,
    ItemPopupViewPositionTop,
    ItemPopupViewPositionBottom
} ItemPopupViewPosition;

@protocol ItemPanelDelegate;

@interface ItemPanel : UIView <UITableViewDataSource,UITableViewDelegate>{
	
    UITableView             *_tableView;
    UIView                  *_containerViewDataView;
    UIView                  *_overlayView;
    UIView                  *_shadowView;
    ItemPopupBackgroundView *_backgroundView;
    BOOL                    isCancelButton;
    UIButton                *_cancelButton;
    ItemPopupViewPosition   itemPanelPosition;
    
    float tableViewHeight;
}

- (instancetype)initWithCancelButton:(BOOL)cancelButton;

@property (nonatomic, assign) id<ItemPanelDelegate> delegate;
@property (nonatomic, assign) int selectedIndex;
@property (nonatomic, assign) ItemPanelType itemPanelType;
@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSMutableArray *checkedItems;
@property (nonatomic, strong) NSString *selectedItem;
@property (nonatomic, copy) id (^cellForIndexPath)(NSIndexPath *, NSString *);

@property (nonatomic, assign)ItemPopupViewPosition itemViewPosition;

- (void)presentPanelItem;

@end

@protocol ItemPanelDelegate <NSObject>
@optional
- (void)panel:(ItemPanel *)panel didSelectAtIndexPath:(NSIndexPath *)indexPath withObject:(id)obj;
- (void)panelDismissed;
@end
