//
//  NSDate+MK_Creation.h
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK.h"

@interface NSDate (MK_Creation)

+ (NSDate *)MK_dateTomorrow;
+ (NSDate *)MK_dateYesterday;

+ (NSDate *)MK_dateWithoutTime;
+ (NSDate *)MK_dateWithDaysFromNow:(NSInteger)days;
+ (NSDate *)MK_dateFromString:(NSString *)string;
+ (NSDate *)MK_dateFromString:(NSString *)string withFormat:(NSString *)format;

- (NSDate *)MK_dateWithoutTime;

@end
