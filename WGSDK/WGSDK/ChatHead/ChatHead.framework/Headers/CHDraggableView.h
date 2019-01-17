//
//  CHDraggableView.h
//  ChatHeads
//
//  Created by Matthias Hochgatterer on 4/19/13.
//  Copyright (c) 2013 Matthias Hochgatterer. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CHDraggableViewDelegate;
@protocol CHDraggableViewDataDelegate;

@interface CHDraggableView : UIView

@property (nonatomic, assign) id<CHDraggableViewDelegate> delegate;
@property (nonatomic, assign) id<CHDraggableViewDataDelegate> dataDelegate;
@property (nonatomic, assign) BOOL chatHeadExpanded;
@property (nonatomic, assign) BOOL moved;
@property (nonatomic, assign) BOOL scaledDown;
@property (nonatomic, assign) CGPoint startTouchPoint;
@property (nonatomic, retain)UIColor *draggableViewColor;
- (void)_moveByDeltaX:(CGFloat)x deltaY:(CGFloat)y;
- (void)_beginReleaseAnimation;

- (void)snapViewCenterToPoint:(CGPoint)point edge:(CGRectEdge)edge;
-(void)showSubViews;
-(void)hideSubViews;
-(void)reloadData:(NSDictionary*)dict;
-(void) reloadBadge;

@end

@protocol CHDraggableViewDelegate <NSObject>

- (void)draggableViewHold:(CHDraggableView *)view;
- (void)draggableView:(CHDraggableView *)view didMoveToPoint:(CGPoint)point;
- (void)draggableViewReleased:(CHDraggableView *)view;

- (void)draggableViewTouched:(CHDraggableView *)view;

- (void)draggableViewNeedsAlignment:(CHDraggableView *)view;

-(UIView*) headerView;



@end

@protocol CHDraggableViewDataDelegate <NSObject>

-(NSInteger) getOperatorBadgeCount;

@end

