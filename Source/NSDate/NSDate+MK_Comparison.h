//
//  NSDate+MK_Comparison.h
//  MKFoundation
//
//  Created by Michal Konturek on 08/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MK_Comparison)

- (BOOL)mk_isToday;
- (BOOL)mk_isTomorrow;
- (BOOL)mk_isYesterday;

- (BOOL)mk_isThisWeek;
- (BOOL)mk_isNextWeek;
- (BOOL)mk_isLastWeek;
- (BOOL)mk_isSameWeekAsDate:(NSDate *)other;

- (BOOL)mk_isThisYear;
- (BOOL)mk_isNextYear;
- (BOOL)mk_isLastYear;
- (BOOL)mk_isSameYearAsDate:(NSDate *)other;

- (BOOL)mk_isEarlierThanDate:(NSDate *)other;
- (BOOL)mk_isLaterThanDate:(NSDate *)other;

- (BOOL)mk_isEqualToDateIgnoringTime:(NSDate *)other;

@end
