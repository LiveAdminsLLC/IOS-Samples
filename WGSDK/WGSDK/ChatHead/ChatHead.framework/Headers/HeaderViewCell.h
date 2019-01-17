//
//  HeaderViewCell.h
//  ChatHeads
//
//  Created by Amjad on 7/27/16.
//  Copyright © 2016 Matthias Hochgatterer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatHeadManager.h"

@interface HeaderViewCell : UICollectionViewCell
{
    
}
+ (CGSize)getSize:(UICollectionView *)collectionView;
@property (nonatomic, weak)IBOutlet UIImageView *userImageView;
@property (nonatomic, retain)UILongPressGestureRecognizer *longTap;
@property (nonatomic, weak)IBOutlet UIButton *btnDelete;

@property (nonatomic, weak)id<ChatCommunicationDelegate> room;

- (void)reloadData:(id<ChatCommunicationDelegate>)room;
- (void)reloadBadge:(id<ChatCommunicationDelegate>)room;
@property (weak, nonatomic) IBOutlet UILabel *visitorName;

@property (weak, nonatomic) IBOutlet UILabel *typingLabel;
@property (weak, nonatomic) IBOutlet UILabel *badgeCount;

@property (nonatomic, retain) NSTimer* typingStartTimer;
@property (nonatomic, retain) NSTimer* typingEndTimer;
@property (nonatomic, retain) UIColor* selectedColor;

@property (copy)ChatRoomUpdates roomCallBack;

-(void) showAsSelected;

-(void) showAsUnSelected;

@end
