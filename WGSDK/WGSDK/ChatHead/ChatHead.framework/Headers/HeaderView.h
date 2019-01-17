//
//  HeaderView.h
//  ChatHeads
//
//  Created by Amjad on 7/27/16.
//  Copyright © 2016 Matthias Hochgatterer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHDraggableView.h"
#import "CHDraggingCoordinator.h"

@interface HeaderView : UIView
@property (nonatomic, weak)IBOutlet UICollectionView *collectionView;
@property (nonatomic, retain)NSArray *localDataSource;
@property (nonatomic, retain)UIColor *headerViewColor;

@property (copy)void(^roomSelected)(id room);

@property (copy)void(^chatClosed)(id data);

-(void) reloadData;

- (IBAction)closeButton:(id)sender;

@end
