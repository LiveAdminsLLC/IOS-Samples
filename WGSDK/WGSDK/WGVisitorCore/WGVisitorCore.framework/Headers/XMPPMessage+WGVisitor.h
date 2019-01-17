//
//  XMPPMessage+WGVisitor.h
//  WGVisitorOperatorPanel
//
//  Created by on 12/27/12.
//
//

//#import "XMPP.h"
//#import "XMPPFramework/XMPPMessage.h"
#import <XMPPFramework/XMPPMessage.h>

@interface XMPPMessage (WGVisitor)

//- (NSString*) chatId;
- (NSString*) websiteId;
- (NSString*) visitorId;
- (NSString*) visitorName;
- (void) registerNamespaces;
- (NSString*) wgChatMessage;

- (NSString *) wgChatSender;
- (NSString *) wgChatRoomId;
- (NSDate *) getTimeStamp;
-(BOOL) ignoreMessage;
- (NSString*) managerId;

/*
 Group chat is recieved when room has some issue for instace 
 <message xmlns="jabber:client" type="groupchat" from="room3629@conference.maavratech.com" to="382@maavratech.com/c6059920"><body>This room is locked from entry until configuration is confirmed.</body></message>
 */
- (BOOL) isGroupChat;
- (void)addComposingState;
@end
