//
//  NSDate+MK_Manipulation.h
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKFoundation.h"

@interface NSDate (MK_Manipulation)

- (NSDate *)dateByAddingDays:(NSInteger)days;
- (NSDate *)dateByAddingWeeks:(NSInteger)weeks;
- (NSDate *)dateByAddingMonths:(NSInteger)months;
- (NSDate *)dateByAddingYears:(NSInteger)years;

- (NSDate *)dateBySubtractingDays:(NSInteger)days;
- (NSDate *)dateBySubtractingWeeks:(NSInteger)weeks;
- (NSDate *)dateBySubtractingMonths:(NSInteger)months;
- (NSDate *)dateBySubtractingYears:(NSInteger)years;

- (NSInteger)differenceInDaysToDate:(NSDate *)toDate;
- (NSInteger)differenceInMonthsToDate:(NSDate *)toDate;
- (NSInteger)differenceInYearsToDate:(NSDate *)toDate;

@end
