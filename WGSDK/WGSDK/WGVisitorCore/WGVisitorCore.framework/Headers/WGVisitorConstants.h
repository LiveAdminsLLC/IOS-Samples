//
//  Constants.h
//  JabberClient
//
//  Created by Tallha on 08/17/17.
//
//


#ifndef JabberClient_Constants_h
#define JabberClient_Constants_h

#define DEBUG false

#if DEBUG
#define WGVisitorDLog(format, ...) NSLog((format), ## __VA_ARGS__)
#else
#define WGVisitorDLog(format, ...)
#endif

typedef enum {
    
    KConnecting,
    KConnected,
    KDisconnecting
    
    
}ConnectingState;

typedef NS_ENUM(NSInteger, RoomStatus) {
    

    RoomStatusJoined,
    RoomStatusLeft,
    RoomStatusFirstMessage,
    
    RoomStatusMessageReceived,
    
    
    RoomStatusJoining,
    
    RoomStatusFailedJoin,
    
    RoomStatusAutoDelayStart,
    RoomStatusAutoDelayEnd,
    
    RoomStatusTypingStart,
    RoomStatusTypingEnd,
    
    RoomStatusInfoChanged,
    
    RoomStatusDealloced,
    RoomStatusMessageReload,
    RoomStatusMessageSent,
    RoomStatusMessageNotSent,
};

typedef void(^RoomUpdates)(id room,RoomStatus status);


#define BLUE_COLOR  [UIColor colorWithRed:0.2627 green:0.4235 blue:0.7490 alpha:1.0]
#define WHITE_COLOR  [UIColor colorWithRed:0.9808 green:0.9808 blue:0.9808 alpha:1.0]
#define LIGHT_BLACK   [UIColor colorWithRed:0.2784 green:0.2784 blue:0.2784 alpha:1.0]


#define WGVisitorLCS_DEVELOPER false //Set FALSE to connect to live server, beware not to use Yes/NO or anything else


#if WGVisitorLCS_DEVELOPER


#define WebServiceURL_ManagementServiceXMPP @"http://192.168.2.237/ManagementService/ManagementService.asmx"

#define WebServiceURL_ChatServiceXMPP @"http://192.168.2.237/ChatService/Service.asmx"

#define SERVICE_URL @"http://192.168.2.237/VisitorService/ChatService.svc/"

#define _WGVisitorServerName @"localhost"//used with login
#define _WGVisitorHostName @"192.168.2.237"//XMPP host name


#define _ServerName @"localhost"




#else//Live Server

#define WebServiceURL_ManagementServiceXMPP @"https://thechatsoftware.com/ManagementService/ManagementService.asmx"
#define _WGVisitorServerName @"localhost"//used with login

//#define _WGVisitorHostName @"192.168.2.237"
#define _WGVisitorHostName @"thechatsoftware.com"
#define _ServerName @"localhost"

#define SERVICE_URL @"https://blue.thelivechatsoftware.com/VisitorServiceXMPPSSL/ChatService.svc/"
#endif

#define DEWA_SERVICE_URL @"https://beta.thelivechatsoftware.com/VisitorService_Mobile/ChatService.svc/"
#define _WGVisitorReports_APICODE @"A981B8AD639E"


#define WebServiceURL

//Ignore strings

#define wgIgnoreMessage_DND @"[DND]"
#define wgIgnoreMessage_Ignore @"[Ignore]"
#define wgIgnoreMessage_NICKCHANGE @"[NICKCHANGE]"
#define wgIgnoreMessage_UnLockChat @"[UnLockChat]"
#define wgIgnoreMessage_LockChat @"[LockChat]"
#define wgIgnoreMessage_About_None_Paused_ignore @"Other Than Body Packet"
#define wgIgnoreMessage_ThisRoomIsNotAnonymous @"This room is not anonymous."


#define _WGVisitorServerPort 5225
//Error Messages
#define _LockRoomErrorString @"This room is locked from entry until configuration is confirmed."
#define _RoomDestroyed @"[destroy room]"
#define _WgRoomError @"System"

//Alert Messages

#define _Alert_At_LoginProcessIndicator @"Loading Data"

//Reports


//Panels Constants
#define OPERATOR_PANEL 1
#define OTHER_PANEL 2

//#define BAR 3
#define LINE 4

#define WGVisitor_HTTP_Refresh @"WGVisitor_HTTP_Refresh"

#endif
