//
//  ItemPanel.m
//  iAIST
//
//  Created by Shohin on 4/15/14.
//  Copyright (c) 2014 Shohin. All rights reserved.
//

#import "ItemPanel.h"
#import "ItemPanelCell.h"

#define colorWithRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define MAXWIDTH [UIScreen mainScreen].bounds.size.width
#define MAXHEIGHT [UIScreen mainScreen].bounds.size.height

#define kPopupModalAnimationDuration 0.35
#define kMJSourceViewTag 23941
#define kMJPopupViewTag 23942
#define kMJBackgroundViewTag 23943
#define kMJOverlayViewTag 23945
#define kMJShadowViewTag 23946

#define TABLEVIEW_HEIGHT        300
#define WIDTH_TABLE_VIEW        300
#define HEIGHT_TABLE_VIEW_CELL  45
#define X                       10

#define RED_CUSTOM_COLOR colorWithRGB(194, 38, 40)

@implementation ItemPanel

@synthesize items = _items;
@synthesize delegate = _delegate;
@synthesize selectedIndex = _selectedIndex;
@synthesize indexPath = _indexPath;
@synthesize cellForIndexPath = _cellForIndexPath;

- (id)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCancelButton:(BOOL)cancelButton
{
    self = [self init];
    if (self) {
        if (cancelButton) {
            isCancelButton = cancelButton;
            itemPanelPosition = ItemPopupViewPositionBottom;
            _cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(X, 0, WIDTH_TABLE_VIEW, HEIGHT_TABLE_VIEW_CELL)];
            _cancelButton.backgroundColor = [UIColor whiteColor];
            [_cancelButton setTitleColor:colorWithRGB(47, 46, 45) forState:UIControlStateNormal];
            _cancelButton.layer.borderColor = RED_CUSTOM_COLOR.CGColor;
            _cancelButton.layer.borderWidth = 2.0f;
            _cancelButton.clipsToBounds = YES;
            _cancelButton.layer.cornerRadius = 10.0f;
            [_cancelButton addTarget:self action:@selector(dismissPopupViewControllerWithanimation:) forControlEvents:UIControlEventTouchUpInside];
            [_containerViewDataView addSubview:_cancelButton];
        }
    }
    
    return self;
}

#pragma mark -
#pragma mark View Handling

- (void)dismissPopupViewControllerWithanimationType:(ItemPopupViewAnimation)animationType
{
    UIView *popupView = [self viewWithTag:kMJPopupViewTag];
    UIView *overlayView = [self viewWithTag:kMJOverlayViewTag];
    
    [self fadeViewOut:popupView sourceView:self overlayView:overlayView];
}

- (void)initialize
{
    self.frame = CGRectMake(0, 0, MAXWIDTH, MAXHEIGHT);
    
    _containerViewDataView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAXWIDTH, 0)];
    _containerViewDataView.backgroundColor = [UIColor clearColor];
    
    _tableView = [[UITableView alloc] init];
	_tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tag = kMJPopupViewTag;
    _tableView.layer.borderColor = [UIColor whiteColor].CGColor;
    _tableView.layer.borderWidth = 2.f;
    _tableView.layer.cornerRadius = 10.f;
    _tableView.alpha = 0.0f;
    _tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
    //_tableView.scrollEnabled = NO;
    
	CGFloat height = 0;
    CGFloat x = (MAXWIDTH - WIDTH_TABLE_VIEW) / 2;
    
    _tableView.frame = CGRectMake(x, 0.f, WIDTH_TABLE_VIEW, height);
    
    _shadowView = [[UIView alloc] init];
    _shadowView.frame = _tableView.frame;
    _shadowView.layer.cornerRadius = 10.f;
    _shadowView.layer.shadowPath = [UIBezierPath bezierPathWithRect:CGRectOffset(_shadowView.frame, 0.f, 7.f)].CGPath;
    _shadowView.layer.shadowRadius = 5.f;
    _shadowView.layer.shadowColor = [[UIColor blackColor] CGColor];
    _shadowView.layer.shadowOpacity =  0.8f;
    _shadowView.tag = kMJShadowViewTag;
    
    // check if source view controller is not in destination
    //if ([sourceView.subviews containsObject:_tableView]) return;
    
    // Add semi overlay
    _overlayView = [[UIView alloc] initWithFrame:self.bounds];
    _overlayView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _overlayView.tag = kMJOverlayViewTag;
    _overlayView.backgroundColor = [UIColor clearColor];
    
    _tableView.clipsToBounds= YES;
    
    // BackgroundView
    _backgroundView = [[ItemPopupBackgroundView alloc] initWithFrame:self.bounds];
    _backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _backgroundView.tag = kMJBackgroundViewTag;
    _backgroundView.backgroundColor = [UIColor clearColor];
    _backgroundView.alpha = 0.0f;
    
    // Make the Background Clickable
    UIButton * dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    dismissButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    dismissButton.backgroundColor = [UIColor clearColor];
    dismissButton.frame = self.bounds;
    [dismissButton addTarget:self action:@selector(dismissPopupViewControllerWithanimation:) forControlEvents:UIControlEventTouchUpInside];

    [_containerViewDataView addSubview:_shadowView];
    [_containerViewDataView addSubview:_tableView];
    
    self.alpha = 0.f;
    self.frame = _overlayView.frame;
    
    [_overlayView addSubview:_backgroundView];
    [self addSubview:_overlayView];
    
    [self addSubview:dismissButton];
    
    [self addSubview:_containerViewDataView];
    
    _checkedItems = [[NSMutableArray alloc] init];
}

- (void)presentPanelItem
{
    self.itemViewPosition = itemPanelPosition;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
    [self fadeViewIn:_tableView sourceView:self overlayView:_overlayView];
}

- (void)dismissPopupViewControllerWithanimation:(id)sender
{
    if ([_delegate respondsToSelector:@selector(panelDismissed)])
        [_delegate panelDismissed];
    
    [self dismissPopupViewControllerWithanimationType:ItemPopupViewAnimationFade];
}


#pragma mark --- Fade

- (void)fadeViewIn:(UIView*)popupView sourceView:(UIView*)sourceView1 overlayView:(UIView*)overlayView
{
    UIView *backgroundView = [overlayView viewWithTag:kMJBackgroundViewTag];
    UIView *shadowView = [overlayView viewWithTag:kMJShadowViewTag];
    
    popupView.alpha = 0.0f;
    
    [UIView animateWithDuration:kPopupModalAnimationDuration animations:^{
        backgroundView.alpha = 0.7f;
        popupView.alpha = 1.0f;
        shadowView.alpha = 1.f;
        self.alpha = 1.f;
    } completion:^(BOOL finished) {
    }];
    
}

- (void)fadeViewOut:(UIView*)popupView sourceView:(UIView*)sourceView overlayView:(UIView*)overlayView
{
    UIView *shadowView = [overlayView viewWithTag:kMJShadowViewTag];
    UIView *backgroundView = [overlayView viewWithTag:kMJBackgroundViewTag];
    [UIView animateWithDuration:kPopupModalAnimationDuration animations:^{
        backgroundView.alpha = 0.0f;
        popupView.alpha = 0.0f;
        self.alpha = 0.0f;
        shadowView.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"CellIdentifier"];
	
    ItemPanelCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[ItemPanelCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
	
    id obj = [_items objectAtIndex:indexPath.row];
    cell.titleLabel.text = obj;
    if (self.images.count > indexPath.row) {
        cell.cellImage = [UIImage imageNamed:self.images[indexPath.row]];
    }
    if (_checkedItems.count > 0) {
        if ([_checkedItems containsObject:obj]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    
    if ([_selectedItem isEqualToString:obj]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    return HEIGHT_TABLE_VIEW_CELL;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id selectedObject = _items[indexPath.row];
    id object = selectedObject;
    
    switch (self.itemPanelType) {
        case ItemPanelTypeNone: {
            [self dismissPopupViewControllerWithanimationType:ItemPopupViewAnimationFade];
        }
            break;
        case ItemPanelTypeCheckbox: {
            ItemPanelCell *cell = (ItemPanelCell *)[_tableView cellForRowAtIndexPath:indexPath];
            if (_checkedItems == nil) {
                _checkedItems = [NSMutableArray array];
            }
            if ([_checkedItems containsObject:selectedObject]) {
                [_checkedItems removeObject:selectedObject];
                cell.accessoryType = UITableViewCellAccessoryNone;
            } else {
                [_checkedItems addObject:selectedObject];
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            object = _checkedItems;
        }
            break;
        case ItemPanelTypeRadioGroup: {
            for (int i = 0; i < _items.count; i++) {
                NSIndexPath *inP = [NSIndexPath indexPathForRow:i inSection:0];
                ItemPanelCell *cell = (ItemPanelCell *)[_tableView cellForRowAtIndexPath:inP];
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
            ItemPanelCell *cell = (ItemPanelCell *)[_tableView cellForRowAtIndexPath:indexPath];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            [self dismissPopupViewControllerWithanimationType:ItemPopupViewAnimationFade];
        }
            break;
        default:
            break;
    }
    if ([_delegate respondsToSelector:@selector(panel:didSelectAtIndexPath: withObject:)]) {
        [_delegate panel:self didSelectAtIndexPath:indexPath withObject:object];
    }
}

#pragma mark - position
- (void)setItemViewPosition:(ItemPopupViewPosition)itemViewPosition
{
    _itemViewPosition = itemViewPosition;
    switch (itemViewPosition) {
        case ItemPopupViewPositionCenter: {
            _containerViewDataView.y = (MAXHEIGHT - tableViewHeight) / 2;
        }
            break;
        case ItemPopupViewPositionBottom: {
            if (isCancelButton) {
                _containerViewDataView.y = MAXHEIGHT - tableViewHeight - 65;
                _cancelButton.y = tableViewHeight + 5;
            } else {
                _containerViewDataView.y = MAXHEIGHT - tableViewHeight - 10;
            }
        }
            break;
        case ItemPopupViewPositionTop: {
            _containerViewDataView.y = 80;
        }
            break;
        default:
            break;
    }
}

#pragma mark - items
- (void)setItems:(NSArray *)items
{
    _items = items;
    CGFloat height = [_items count] * HEIGHT_TABLE_VIEW_CELL;
    if (height > TABLEVIEW_HEIGHT) {
        height = TABLEVIEW_HEIGHT;
    }
    tableViewHeight = height;
    _tableView.height = height;
    _shadowView.height = height;
    _containerViewDataView.height = height;
    if (itemPanelPosition == 0) {
        itemPanelPosition = ItemPopupViewPositionCenter;
    }
}

@end
