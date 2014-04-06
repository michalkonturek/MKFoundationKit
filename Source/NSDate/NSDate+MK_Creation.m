//
//  NSDate+MK_Creation.m
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

#import "NSDate+MK_Creation.h"

#import "NSDate+MK_Manipulation.h"
#import "NSDate+MK_Formatting.h"

@implementation NSDate (MK_Creation)

+ (NSDate *)mk_dateTomorrow {
    return [[NSDate date] mk_dateByAddingDays:1];
}

+ (NSDate *)mk_dateYesterday {
    return [[NSDate date] mk_dateBySubtractingDays:1];
}

+ (NSDate *)mk_dateWithoutTime {
    return [[NSDate date] mk_dateWithoutTime];
}

+ (NSDate *)mk_dateWithDaysFromNow:(NSInteger)days {
    return [[NSDate date] mk_dateByAddingDays:days];
}

+ (NSDate *)mk_dateFromString:(NSString *)string {
    return [self mk_dateFromString:string withFormat:[NSDate mk_dateFormatDDMMYYYYDashed]];
}

+ (NSDate *)mk_dateFromString:(NSString *)string withFormat:(NSString *)format {
    
    if ((NSNull *)string == [NSNull null] || string == nil) {
        return nil;
    }
    
    if (format == nil) {
        format = [NSDate mk_dateFormatDDMMYYYYDashed];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate *result = [formatter dateFromString:string];
    
    return result;
}

- (NSDate *)mk_dateWithoutTime {
    NSString *formattedString = [self mk_formattedString];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:[NSDate mk_dateFormatDDMMYYYYDashed]];
    NSDate *result = [formatter dateFromString:formattedString];
    
    return result;
}

@end
