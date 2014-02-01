//
//  NSDate+MK_Manipulation.h
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MK_Manipulation)

- (NSDate *)mk_dateByAddingDays:(NSInteger)days;
- (NSDate *)mk_dateByAddingWeeks:(NSInteger)weeks;
- (NSDate *)mk_dateByAddingMonths:(NSInteger)months;
- (NSDate *)mk_dateByAddingYears:(NSInteger)years;

- (NSDate *)mk_dateByAddingHours:(NSInteger)hours;
- (NSDate *)mk_dateByAddingMinutes:(NSInteger)minutes;
- (NSDate *)mk_dateByAddingSeconds:(NSInteger)seconds;

- (NSDate *)mk_dateBySubtractingDays:(NSInteger)days;
- (NSDate *)mk_dateBySubtractingWeeks:(NSInteger)weeks;
- (NSDate *)mk_dateBySubtractingMonths:(NSInteger)months;
- (NSDate *)mk_dateBySubtractingYears:(NSInteger)years;

- (NSDate *)mk_dateBySubtractingHours:(NSInteger)hours;
- (NSDate *)mk_dateBySubtractingMinutes:(NSInteger)minutes;
- (NSDate *)mk_dateBySubtractingSeconds:(NSInteger)seconds;

- (NSInteger)mk_differenceInDaysToDate:(NSDate *)toDate;
- (NSInteger)mk_differenceInMonthsToDate:(NSDate *)toDate;
- (NSInteger)mk_differenceInYearsToDate:(NSDate *)toDate;

@end
