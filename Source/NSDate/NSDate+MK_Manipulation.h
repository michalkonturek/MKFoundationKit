//
//  NSDate+MK_Manipulation.h
//  MKFoundation
//
//  Copyright (c) 2013 Michal Konturek
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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

- (NSInteger)mk_differenceInHoursToDate:(NSDate *)toDate;
- (NSInteger)mk_differenceInMinutesToDate:(NSDate *)toDate;
- (NSInteger)mk_differenceInSecondsToDate:(NSDate *)toDate;

@end
