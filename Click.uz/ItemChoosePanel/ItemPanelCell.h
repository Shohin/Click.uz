//
//  ItemPanelCell.h
//  iAIST
//
//  Created by Shohin on 4/15/14.
//  Copyright (c) 2014 Shohin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemCellBackgroundView.h"

@interface ItemPanelCell : UITableViewCell

@property (nonatomic, assign) ItemCellBackgroundViewPosition position;

@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIImage *cellImage;

@end
