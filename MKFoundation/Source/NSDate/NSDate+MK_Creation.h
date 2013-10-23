//
//  NSDate+MK_Creation.h
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK.h"

@interface NSDate (MK_Creation)

+ (NSDate *)dateWithoutTime;
+ (NSDate *)dateFromString:(NSString *)string;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;

- (NSDate *)dateAsDateWithoutTime;

@end
