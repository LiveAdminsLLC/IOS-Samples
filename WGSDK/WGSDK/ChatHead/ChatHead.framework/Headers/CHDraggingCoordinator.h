//
//  CHDraggingCoordinator.h
//  ChatHeads
//
//  Created by Matthias Hochgatterer on 4/19/13.
//  Copyright (c) 2013 Matthias Hochgatterer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CHDraggableView.h"

typedef enum {
    CHInteractionStateNormal,
    CHInteractionStateConversation
} CHInteractionState;

typedef enum {
    CHSnappingEdgeBoth,
    CHSnappingEdgeRight,
    CHSnappingEdgeLeft
} CHSnappingEdge;

@protocol CHDraggingCoordinatorDelegate;

@interface CHDraggingCoordinator : NSObject <CHDraggableViewDelegate>

@property (nonatomic, strong) UINavigationController *presentedNavigationController;
@property (nonatomic) CHSnappingEdge snappingEdge;
@property (nonatomic, weak) id<CHDraggingCoordinatorDelegate> delegate;
@property (nonatomic, assign) CHInteractionState state;
@property (nonatomic, assign) CGRect draggableViewBounds;


- (void)_animateViewToEdges:(CHDraggableView *)view;
- (CGPoint)_destinationPointForReleasePoint:(CGPoint)releasePoint;
- (void)draggableViewTouched:(CHDraggableView *)view;

- (id)initWithWindow:(UIWindow *)window;
- (CGRect)_navigationControllerFrame;

-(void) reloadHeaderView:(id) data;

-(void) closeHeaderView:(id) data;

-(UIViewController*) getPresentedChatDetailController;
- (void)_unhidePresentedNavigationControllerCompletion:(void(^)())completionBlock;
-(void)hideCollectionView;

- (void)_animateView:(CHDraggableView *)view toEdgePoint:(CGPoint)point;
- (void)_dismissPresentedNavigationController;

-(void)showHeadView;
-(void)hideHeadView;

@end


@protocol CHDraggingCoordinatorDelegate <NSObject>

- (UIViewController *)draggingCoordinator:(CHDraggingCoordinator *)coordinator viewControllerForDraggableView:(CHDraggableView *)draggableView;

- (void)draggingCoordinatorViewControllerGotHide:(CHDraggingCoordinator *)coordinator ;

@end
