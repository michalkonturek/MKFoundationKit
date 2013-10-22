//
//  NSDate+MK.h
//
//  Created by Michal Konturek on 11/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MK)

+ (NSDate *)dateWithoutTime;
+ (NSDate *)dateFromString:(NSString *)string;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;

+ (NSString *)dateFormatCCCCDDMMMYYYY;
+ (NSString *)dateFormatCCCCDDMMMMYYYY;
+ (NSString *)dateFormatDDMMYYYYSlashed;
+ (NSString *)dateFormatDDMMMYYYYSlashed;
+ (NSString *)dateFormatMMMDDYYYY;
+ (NSString *)dateFormatYYYYMMDDDashed;

- (NSDate *)dateByAddingDays:(NSInteger)numDays;
- (NSDate *)dateAsDateWithoutTime;

- (NSInteger)differenceInYearsToDate:(NSDate *)toDate;
- (NSInteger)differenceInMonthsToDate:(NSDate *)toDate;
- (NSInteger)differenceInDaysToDate:(NSDate *)toDate;

- (NSString *)formattedString;
- (NSString *)formattedStringUsingFormat:(NSString *)dateFormat;

@end
