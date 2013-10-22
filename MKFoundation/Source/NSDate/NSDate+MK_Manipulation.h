//
//  NSDate+MK_Manipulation.h
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSString+MK.h"

@interface NSDate (MK_Manipulation)

- (NSDate *)dateByAddingDays:(NSInteger)numDays;

- (NSInteger)differenceInYearsToDate:(NSDate *)toDate;
- (NSInteger)differenceInMonthsToDate:(NSDate *)toDate;
- (NSInteger)differenceInDaysToDate:(NSDate *)toDate;

@end
