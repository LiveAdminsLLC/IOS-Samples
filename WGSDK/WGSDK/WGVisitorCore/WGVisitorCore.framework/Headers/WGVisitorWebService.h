//
//  WGVisitorWebService.h
//  WGVisitorCore
//
//  Created by on 20/11/2013.
//  Copyright (c) 2013 
//

#import <Foundation/Foundation.h>
//#import "AFNetworking/NSOperationManager.h"
#import "WGVisitorUser.h"
#import "WGVisitorConstants+Status.h"

//@class WGVisitorUser;
@interface WGVisitorWebService : NSObject


@property (nonatomic, assign) BOOL  isHTTPClient;

@property (nonatomic, retain) WGVisitorUser * currentUser;
@property (nonatomic, retain) NSTimer * timer;


@property (nonatomic, assign) BOOL isOperatorServiceActive;//Enable or diable Operator Panel services
@property (nonatomic, assign) BOOL isQAServiceActive;//Enable or diable QA services


- (void) loginClientUser:(WGVisitorUser*)user;


- (void) logout;

+ (instancetype) sharedInstance;


- (id) initSingleton;


#pragma mark - WGVisitorWebSerivce JSon methods
//Don not modify below
- (void) requestDataWithParameters:(NSDictionary*)parameters
                            method:(NSString*)method serviceName:(NSString *)url
                           success:(void (^)(NSOperation *operation, id responseObject))success
                           failure:(void (^)(NSOperation *operation, NSError *error))failure;

- (void) requestData:(NSString *) request withParameters:(NSDictionary*)parameters
          soapAction:(NSString*)soapAction serviceName:(NSString *)url
             success:(void (^)(NSURLResponse *operation, id responseObject))success
             failure:(void (^)(NSURLResponse *operation, NSError *error))failure;

- (void)sendofflineContactToServer:(NSDictionary*) parametersDict WithBlock:(void(^)(BOOL result ,WGVisitorStatus status)) success;

- (void)getLanguagesList:(NSDictionary*) parametersDict WithBlock:(void(^)(BOOL result ,WGVisitorStatus status)) success;

-(void)uploadFile:(NSDictionary *)dataDict success:(void (^) (id responseObject))success failure:(void (^) (id errorResponse))failure;


@end
