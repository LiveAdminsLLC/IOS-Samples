//
//  ChatDetailViewController.h
//  WGOperator
//
//  Created by 
//  Copyright (c) 2013 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSMessagesViewController.h"
#import "SharedData.h"

@import WGVisitorCore;

@class WGVisitorRoom;
@interface ChatDetailViewController : JSMessagesViewController <JSMessagesViewDataSource, JSMessagesViewDelegate>

{

    
    SharedData *sharedData;

}

@property (nonatomic, assign)NSInteger navHeight;
@property (nonatomic, assign)BOOL viaChatHead;

@property (nonatomic, assign)   BOOL automaticCloseBlock;
@property (nonatomic, copy)void(^callback)(WGVisitorStatus status);

@property (nonatomic, copy)void(^visitorRoomCallback)(RoomStatus status);

- (void)disableSendBtn;
-(void) resignMessageInputView;

//-(void) sessionClosed;
@property (nonatomic, retain) WGVisitorRoom * currentRoom;

@end
