//
//  NSDate+MK.m
//
//  Created by Michal Konturek on 11/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK.h"

@implementation NSDate (MK)

+ (NSDate *)dateWithoutTime {
    return [[NSDate date] dateAsDateWithoutTime];
}

+ (NSDate *)dateFromString:(NSString *)string {
    return [self dateFromString:string withFormat:[NSDate dateFormatYYYYMMDDDashed]];
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
    
    if ((NSNull *)string == [NSNull null] || string == nil) {
        return nil;
    }
    
    if (format == nil) {
        format = [NSDate dateFormatYYYYMMDDDashed];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate *result = [formatter dateFromString:string];
//    [formatter release];
    
    return result;
}

+ (NSString *)dateFormatCCCCDDMMMYYYY {
    return @"cccc, dd MMM yyyy";
}

+ (NSString *)dateFormatCCCCDDMMMMYYYY {
    return @"cccc, dd MMMM yyyy";
}

+ (NSString *)dateFormatDDMMYYYYSlashed {
    return @"dd/MM/YYYY";
}

+ (NSString *)dateFormatDDMMMYYYYSlashed {
    return @"dd/MMM/YYYY";
}

+ (NSString *)dateFormatMMMDDYYYY {
    return @"MMM dd, yyyy";
}

+ (NSString *)dateFormatYYYYMMDDDashed {
    return @"yyyy-MM-dd";
}


-(NSDate *)dateByAddingDays:(NSInteger)numDays {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:numDays];
    
    NSDate *date = [calendar dateByAddingComponents:components toDate:self options:0];
//    [components release];
//    [calendar release];
    return date;
}

- (NSDate *)dateAsDateWithoutTime {
    NSString *formattedString = [self formattedString];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:[NSDate dateFormatMMMDDYYYY]];
    NSDate *ret = [formatter dateFromString:formattedString];
//    [formatter release];
    return ret;
}

- (NSInteger)differenceInYearsToDate:(NSDate *)toDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSYearCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlags fromDate:self toDate:toDate options:0];
    return [components year];
}

- (NSInteger)differenceInMonthsToDate:(NSDate *)toDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSMonthCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlags fromDate:self toDate:toDate options:0];
    return [components month];
}

- (NSInteger)differenceInDaysToDate:(NSDate *)toDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSDayCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlags fromDate:self toDate:toDate options:0];
    return [components day];
}


- (NSString *)formattedString {
    return [self formattedStringUsingFormat:[NSDate dateFormatMMMDDYYYY]];
}

- (NSString *)formattedStringUsingFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    NSString *ret = [formatter stringFromDate:self];
//    [formatter release];
    return ret;
}


@end
