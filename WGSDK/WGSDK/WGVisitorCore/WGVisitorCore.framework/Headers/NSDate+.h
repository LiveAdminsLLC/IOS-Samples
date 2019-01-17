//
//  NSDate+.h
//
//  Created by Bruno Tortato Furtado on 14/11/12.
//  Copyright (c) 2012 Bruno Tortato Furtado. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Plus)


#pragma mark - class methods

+ (NSDate *)now;

+ (NSString *)defaultFormat;
+ (void)setDefaultFormat:(NSString *)format;


#pragma mark - convert string from date

+ (NSDate *)dateFromString:(NSString *)string;

+ (NSDate *)dateFromString:(NSString *)string
                withFormat:(NSString *)format;


#pragma mark - convert date from string

+ (NSString *)stringFromDate:(NSDate *)date;

+ (NSString *)stringFromDate:(NSDate *)date
                  withFormat:(NSString *)format;
+ (NSDate *)utctoLocalFromString:(NSString *)string withFormat:(NSString *)format;
+ (NSDate *)dateWithLocalTimeZone:(NSString *)string withFormat:(NSString *)format;
@end
