//
//  NSDate+MK_Creation.h
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MK_Creation)

+ (NSDate *)mk_dateTomorrow;
+ (NSDate *)mk_dateYesterday;

+ (NSDate *)mk_dateWithoutTime;
+ (NSDate *)mk_dateWithDaysFromNow:(NSInteger)days;
+ (NSDate *)mk_dateFromString:(NSString *)string;
+ (NSDate *)mk_dateFromString:(NSString *)string withFormat:(NSString *)format;

- (NSDate *)mk_dateWithoutTime;

@end
