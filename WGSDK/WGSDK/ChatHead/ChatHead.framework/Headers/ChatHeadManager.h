//
//  ChatHeadManager.h
//  WGOperator
//
//  Created by Pro on 03/09/2018.
//  Copyright © 2018 Maavratech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHDraggableView.h"
#import "CHDraggingCoordinator.h"
#import "UIView+DraggableView.h"

#define CHAT_DELAY_COLOR [UIColor lightGrayColor]
//#define BLUE   [UIColor colorWithRed:0.2784 green:0.4431 blue:0.7529 alpha:1.0]

typedef NS_ENUM(NSInteger, ChatRoomStatus) {
    
    ChatRoomStatusJoined,
    ChatRoomStatusLeft,
    
    ChatRoomStatusFirstMessage,
    
    ChatRoomStatusMessageReceived,
    
    ChatRoomStatusFailedJoin,
    ChatRoomStatusAutoDelayStart,
    
    
    ChatRoomStatusAutoDelayEnd,
    
    ChatRoomStatusTypingStart,
    ChatRoomStatusTypingEnd,
    
    ChatRoomStatusInfoChanged,
    
    ChatRoomStatusDealloced,
    
    ChatRoomStatusDestroyed,
    ChatRoomStatusMessageReload,
    ChatRoomStatusMessageSent,
    ChatRoomStatusMessageLockUnlock,
    
    ChatRoomStatusVideoCall,
    ChatRoomStatusVisitorInformationLoaded,
    

};

typedef void(^ChatRoomUpdates)(id room,ChatRoomStatus status);

@protocol ChatCommunicationDelegate;

@interface ChatHeadManager : NSObject<CHDraggingCoordinatorDelegate>
@property (nonatomic, assign)BOOL showDraggableViewIfRequired;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIView* deleteView;
@property (weak, nonatomic) id <ChatCommunicationDelegate> currentRoom;
@property (strong, nonatomic) CHDraggableView *draggableView;
@property (strong, nonatomic) CHDraggingCoordinator *draggingCoordinator;
@property (strong, nonatomic) NSMutableArray *chatViews;



+ (ChatHeadManager *)sharedInstance;

- (void)setupWithWindow:(UIWindow *)window chDraggingCoordinatorDelegate:(id<CHDraggingCoordinatorDelegate>)draggingCoordinatorDelegate;

-(void)addDragViewWithCoordinator:(CHDraggingCoordinator *)draggingCoordinator dataDelegate:(id<CHDraggableViewDataDelegate>) dataDelegate chatViews:(NSMutableArray *)chatViews color:(UIColor *)color;
-(void)deleteChatHead;
-(void) removeChatHeadsResources;


@end

//For wgroom
@protocol ChatCommunicationDelegate <NSObject>

- (void)addRoomUpdatesCallBack:(ChatRoomUpdates)callBack;
- (void)removeRoomUpdateCallback:(ChatRoomUpdates)callBack;
- (NSDictionary *)lastChatMessageData;
- (BOOL) isDelayed;
- (NSInteger) unreadMessagesCount;
- (NSString *) visitorName;
- (NSString *) operatorName;

@end
