//
//  WGVisitorSoundPlayer.h
//  WGVisitor
//
//  Created by Pro on 10/22/14.
//  Copyright (c) 2014 Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WGVisitorSoundPlayer : NSObject

+ (void)playMessageReceivedSound;

+ (void)playMessageSentSound;

+ (void)playSoundWithName:(NSString *)name type:(NSString *)type;

@end
