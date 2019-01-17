//
//  RoomsManager.h
//  WGCore
//
//  Created by Pro on 01/02/2016.
//  Copyright © 2016 Maavratech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WGVisitorRoom.h"

@interface RoomsManager : NSObject

{

}

+ (RoomsManager *)sharedInstance;

@property (nonatomic, retain)NSMutableDictionary *roomsDict;


- (void)addRoom:(WGVisitorRoom *)room;
-(WGVisitorRoom*)isRoomExists:(NSString*) roomId;
- (void)removeRoomById:(NSString *)roomId;
- (BOOL)isUsedByAny:(WGVisitorRoom *)room;

- (void)removeAllRooms;
- (void)removeRoomByIdIfNotUsedById:(NSString *)roomId;
- (void)removeRoomByIdIfNotUsedByObject:(WGVisitorRoom *)room;

- (void)removeAllQCRooms;

- (void)removeOperatorRooms;

@end
