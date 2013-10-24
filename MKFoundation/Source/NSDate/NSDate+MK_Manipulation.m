//
//  NSDate+MK_Manipulation.m
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK_Manipulation.h"

@implementation NSDate (MK_Manipulation)

- (NSDate *)dateByAddingDays:(NSInteger)days {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:days];
    
    NSDate *date = [calendar dateByAddingComponents:components toDate:self options:0];
    return date;
}

- (NSDate *)dateByAddingWeeks:(NSInteger)weeks {
    return [self dateByAddingDays:(weeks * 7)];
}

- (NSDate *)dateByAddingMonths:(NSInteger)months {
    METHOD_NOT_IMPLEMENTED
}

- (NSDate *)dateByAddingYears:(NSInteger)years {
    METHOD_NOT_IMPLEMENTED
}

- (NSDate *)dateBySubtractingDays:(NSInteger)days {
    METHOD_NOT_IMPLEMENTED
}

- (NSDate *)dateBySubtractingWeeks:(NSInteger)weeks {
    METHOD_NOT_IMPLEMENTED
}

- (NSDate *)dateBySubtractingMonths:(NSInteger)months {
    METHOD_NOT_IMPLEMENTED
}

- (NSDate *)dateBySubtractingYears:(NSInteger)years {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)differenceInDaysToDate:(NSDate *)toDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSDayCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlags fromDate:self toDate:toDate options:0];
    return [components day];
}

- (NSInteger)differenceInMonthsToDate:(NSDate *)toDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSMonthCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlags fromDate:self toDate:toDate options:0];
    return [components month];
}

- (NSInteger)differenceInYearsToDate:(NSDate *)toDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSYearCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlags fromDate:self toDate:toDate options:0];
    return [components year];
}

@end
