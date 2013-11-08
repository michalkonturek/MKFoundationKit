//
//  NSDate+MK_Comparison.h
//  MKFoundation
//
//  Created by Michal Konturek on 08/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK.h"

@interface NSDate (MK_Comparison)

- (BOOL)MK_isToday;
- (BOOL)MK_isTomorrow;
- (BOOL)MK_isYesterday;

- (BOOL)MK_isThisWeek;
- (BOOL)MK_isNextWeek;
- (BOOL)MK_isLastWeek;
- (BOOL)MK_isSameWeekAsDate:(NSDate *)date;

- (BOOL)MK_isThisYear;
- (BOOL)MK_isNextYear;
- (BOOL)MK_isLastYear;
- (BOOL)MK_isSameYearAsDate:(NSDate *)date;

- (BOOL)MK_isEarlierThanDate:(NSDate *)date;
- (BOOL)MK_isLaterThanDate:(NSDate *)date;

- (BOOL)MK_isEqualToDateIgnoringTime:(NSDate *)date;

@end
