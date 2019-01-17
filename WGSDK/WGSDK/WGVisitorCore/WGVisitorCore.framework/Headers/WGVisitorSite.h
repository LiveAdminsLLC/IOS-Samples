//
//  Site.h
//  WGVisitorOperatorPanel
//
//  Created by on 12/25/12.
//
//

#import <Foundation/Foundation.h>


@interface WGVisitorSite : NSObject

@property (nonatomic, retain) NSString * siteId;
@property (nonatomic, retain) NSString * siteName;
@property (nonatomic, retain) NSString * siteDesc;
@property (nonatomic, retain) NSMutableDictionary  *rooms;
@property (nonatomic, assign)NSInteger indexInArray;

- (void) joinAllRoom;
- (void) closeAllRooms;
@end
