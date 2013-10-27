//
//  NSDate+MK_Manipulation.h
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKFoundation.h"

@interface NSDate (MK_Manipulation)

- (NSDate *)MK_dateByAddingDays:(NSInteger)days;
- (NSDate *)MK_dateByAddingWeeks:(NSInteger)weeks;
- (NSDate *)MK_dateByAddingMonths:(NSInteger)months;
- (NSDate *)MK_dateByAddingYears:(NSInteger)years;

- (NSDate *)MK_dateBySubtractingDays:(NSInteger)days;
- (NSDate *)MK_dateBySubtractingWeeks:(NSInteger)weeks;
- (NSDate *)MK_dateBySubtractingMonths:(NSInteger)months;
- (NSDate *)MK_dateBySubtractingYears:(NSInteger)years;

- (NSInteger)MK_differenceInDaysToDate:(NSDate *)toDate;
- (NSInteger)MK_differenceInMonthsToDate:(NSDate *)toDate;
- (NSInteger)MK_differenceInYearsToDate:(NSDate *)toDate;

@end
