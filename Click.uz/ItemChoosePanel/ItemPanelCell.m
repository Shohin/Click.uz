//
//  ItemPanelCell.m
//  iAIST
//
//  Created by Shohin on 4/15/14.
//  Copyright (c) 2014 Shohin. All rights reserved.
//

#import "ItemPanelCell.h"

@interface ItemPanelCell ()
{
    UIImageView *_cellImageView;
}
@end

@implementation ItemPanelCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, self.contentView.frame.size.height - 1)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor blackColor];//colorWithRGB(47, 46, 45);
        [self.contentView addSubview:self.titleLabel];
        
        _cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 5, 35, 35)];
        _cellImageView.backgroundColor = [UIColor clearColor];
        _cellImageView.hidden = YES;
        [self.contentView addSubview:_cellImageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setCellImage:(UIImage *)cellImage
{
    if ([cellImage isKindOfClass:[UIImage class]]) {
        _cellImageView.hidden = NO;
        [_cellImageView setImage:cellImage];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
    } else {
        _cellImageView.hidden = YES;
        self.textLabel.textAlignment = NSTextAlignmentCenter;
    }
}

@end
