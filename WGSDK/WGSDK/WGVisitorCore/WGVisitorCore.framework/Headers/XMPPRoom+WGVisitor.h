//
//  XMPPRoom+WGVisitor.h
//  WGVisitorOperatorPanel
//
//  Created by on 12/31/12.
//
//

@import XMPPFramework;

@interface XMPPRoom (WGVisitor)
- (void) sendWGVisitorMessage:(NSString*) message userId:(NSString*)userId websiteId:(NSString*) websiteId managerId:(NSString*)managerId visitorName:(NSString*) visitorName chatId:(NSString*)chatId;

- (void) sendWGVisitorInvite:(NSString*) inviteMessageStr userId:(NSString*)userId websiteId:(NSString*) websiteId managerId:(NSString*)managerId visitorName:(NSString*) visitorName chatId:(NSString*)chatId operatorID:(NSString*) operatorID;

- (void)sendWGVisitorRoomDestroyMessageUserid:(NSString *)userId andWebSiteId:(NSString *)websiteId andVisitorName:(NSString *)visitorName andChatId:(NSString *)chatId;

-(void) disconnect;
- (void)sendActiveChatState;
- (void)sendComposingChatState;
- (void)sendPausedChatState;
- (void)sendInactiveChatState;
- (void)sendGoneChatState;

@end
