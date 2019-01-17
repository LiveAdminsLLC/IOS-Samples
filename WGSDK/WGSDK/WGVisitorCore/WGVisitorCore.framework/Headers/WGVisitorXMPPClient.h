/*
 *	WGVisitorXMPPClient.h
 *	WGVisitorOperatorPanel
 *
 *	Created by on 12/17/12.
 *	Copyright 2012 __MyCompanyName__. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "WGVisitorConstants.h"
@import Reachability;


@class WGVisitorRoom,WGVisitorSite;
@class WGVisitorSitesManager;
@protocol XMPPReconnectDelegate;
@protocol XMPPRosterDelegate;
@protocol XMPPStreamDelegate;
@class XMPPStream, XMPPReconnect,XMPPRoster,XMPPRosterCoreDataStorage,XMPPvCardCoreDataStorage,XMPPvCardTempModule,XMPPvCardAvatarModule,XMPPCapabilities,XMPPCapabilitiesCoreDataStorage,XMPPMessage;
@class WGVisitorUser,WGVisitorSite;
@interface WGVisitorXMPPClient : NSObject
{
    BOOL allowSelfSignedCertificates;
	BOOL allowSSLHostNameMismatch;
	
	UIAlertView *alertForConectivity;
    
    
@private
	XMPPStream *xmppStream;
	XMPPReconnect *xmppReconnect;
    XMPPRoster *xmppRoster;
	XMPPRosterCoreDataStorage *xmppRosterStorage;
    XMPPvCardCoreDataStorage *xmppvCardStorage;
	XMPPvCardTempModule *xmppvCardTempModule;
	XMPPvCardAvatarModule *xmppvCardAvatarModule;
	XMPPCapabilities *xmppCapabilities;
	XMPPCapabilitiesCoreDataStorage *xmppCapabilitiesStorage;
    
    
}

@property (nonatomic, assign)BOOL isDisconnectedAllRooms;

@property (nonatomic, assign)NSInteger panelType;
@property (nonatomic, assign) id  _chatDelegate;
@property (nonatomic, assign) id  _messageDelegate;
@property (nonatomic,assign) BOOL isXmppConnected;
@property (nonatomic, strong, readonly) XMPPStream *xmppStream;
@property (nonatomic, strong, readonly) XMPPReconnect *xmppReconnect;
@property (nonatomic, strong, readonly) XMPPRoster *xmppRoster;
@property (nonatomic, strong, readonly) XMPPRosterCoreDataStorage *xmppRosterStorage;
@property (nonatomic, strong, readonly) XMPPvCardTempModule *xmppvCardTempModule;
@property (nonatomic, strong, readonly) XMPPvCardAvatarModule *xmppvCardAvatarModule;
@property (nonatomic, strong, readonly) XMPPCapabilities *xmppCapabilities;
@property (nonatomic, strong, readonly) XMPPCapabilitiesCoreDataStorage *xmppCapabilitiesStorage;




@property (nonatomic, retain) WGVisitorSitesManager * sitesManager;

@property (nonatomic, retain) NSMutableArray *wgCanMessagesArray;

@property (nonatomic ,retain) NSTimer *timerForQAScreen;
@property (nonatomic ,assign ) int badgeCount;
@property (nonatomic ,assign ) int messageCounterForOperatorBadge;
@property (nonatomic ,assign ) BOOL operatorScreenActive;
@property (nonatomic ,assign ) BOOL isxmppStreamDisconnected;
@property (nonatomic,retain) UIAlertView *loadingAlert;
@property (nonatomic,retain)  UIActivityIndicatorView *loadingActivityIndicator;


- (BOOL)isInternetAvaliable;
+ (WGVisitorXMPPClient *) instance;
- (NSManagedObjectContext *)managedObjectContext_roster;
- (NSManagedObjectContext *)managedObjectContext_capabilities;

- (void) loginClientUser:(NSString*) username password:(NSString*)password licenseKey:(NSString*)licenseValue respondBlock:(void (^)(void))block;
- (BOOL)connect;
- (void)disconnect;

- (void) addStreamDelegate:(id) delegate;
- (void) removeStreamDelegate:(id) delegate;
- (void) performLoacalNotification:(BOOL)cancel;

- (void) signout;
-(void) joinAllOperatorRooms;

- (void) goOnline;

//Methods for handling sites with no rooms.

- (NSInteger) sitesCount;
- (WGVisitorSite *) siteWithChatAtIndex:(NSInteger) index;





- (void) createXmpproomwithwebsiteID:(NSString*)websiteID chatId:(NSString *)chatId description:(WGVisitorUser*)visitor operatorId:(NSString*)operatorId forGreeting:(NSString*) greetingMessage forUser:(WGVisitorUser*) user;

- (WGVisitorRoom*) joinXmpproomwitChatID:(NSString *)chatID;

//Offline
- (void)goOffline;


- (BOOL)connectUser:(WGVisitorUser*) user;

-(void) inviteUser;

@property (nonatomic, retain) Reachability* reachability;


@end
