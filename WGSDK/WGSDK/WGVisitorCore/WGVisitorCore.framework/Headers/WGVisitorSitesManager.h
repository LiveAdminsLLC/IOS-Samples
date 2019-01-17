//
//  WGVisitorSitesManager.h
//  WGVisitorCore
//
//  Created by on 20/12/2013.
//  Copyright (c) 2013 
//

#import <Foundation/Foundation.h>


//Manages all the sites and methods to access sites
@class WGVisitorRoom,WGVisitorSite;
@interface WGVisitorSitesManager : NSObject


@property(nonatomic, strong) WGVisitorSite * wgWebsite;
@property (nonatomic,assign)BOOL toShowBranding;
@property(nonatomic,strong) NSString * websiteDomainNameArabic;
@property(nonatomic,strong) NSString * websiteDomainNameEnglish;
@property(nonatomic,strong) NSString * preferredLanguage;

@property (nonatomic, retain)NSMutableArray *allRooms;

-(void) joinAllOperatorRooms;
-(NSMutableArray*) activeOperatorSites;
-(void) closeAllOperatorRooms;

-(void) joinRoom:(WGVisitorRoom*) room;

-(void) leaveRoom:(WGVisitorRoom*) room;

//-(BOOL) isOperatorAvailable;

-(WGVisitorRoom*) getCurrentRoom;
-(WGVisitorSite*) getWebSite;
-(void) clearCurrentRoom;

- (void) visitorPanelWithResult:(void (^)(NSError *error, id responseObject))success;

-(void) startChat:(NSString*)message withBlock:(void (^)(NSError *error, id responseObject, BOOL isRoomJoined))success;

-(void) sendHTTPMessage:(NSString*) message withBlock:(void (^)(NSError *error, id responseObject))success;

-(void) getHTTPMessage:(void (^)(NSError *error, id responseObject))success;

-(void) closeHTTPSession:(void (^)(NSError *error, id responseObject))success;

-(IBAction)closeSession:(id)sender;

- (WGVisitorRoom *)getRoomById:(NSString *)roomId;

@end
