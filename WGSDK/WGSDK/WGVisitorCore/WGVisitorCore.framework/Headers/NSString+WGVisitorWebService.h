//
//  NSString+WGVisitorWebService.h
//  WgLiveGreaterWithStoryBoard
//
//  Created by on 9/10/13.
//  Copyright (c) 2013 
//

#import <Foundation/Foundation.h>

@interface NSString (WGVisitorWebService)
+ (NSString*) formatRequest:(NSString*)request WithParameters:(NSDictionary *)parameters;
+ (NSString*) formatRequestV2:(NSString*)request WithParameters:(NSDictionary *)parameters;
@end
