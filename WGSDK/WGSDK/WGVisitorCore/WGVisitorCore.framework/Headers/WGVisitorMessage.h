//
//  Message.h
//  WGVisitorOperatorPanel
//
//  Created by on 12/25/12.
//
//

#import <Foundation/Foundation.h>
typedef enum MessageType: NSInteger{
    kMessageCurrentUser,
    kMessageVisitor,
    kMessageTrainer,
    kMessageQA,
    kMessageSystem
}MessageType;

@class WGVisitorUser;
@interface WGVisitorMessage : NSObject

@property (nonatomic, retain) NSString * message;
@property (nonatomic, retain) NSString * managerId;

@property (nonatomic, retain) WGVisitorUser * sender;
@property (strong,nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, assign)MessageType messageType;
//
//- (NSBubbleType) messageType;
- (BOOL) isMessageByCurrentUser;

@end
