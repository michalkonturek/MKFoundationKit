//
//  NSDate+MK_Formatting.m
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

#import "NSDate+MK_Formatting.h"

@implementation NSDate (MK_Formatting)

// resource: http://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns

+ (NSString *)mk_dateFormatCCCCDDMMMYYYY {
    return @"cccc, dd MMM yyyy";
}

+ (NSString *)mk_dateFormatCCCCDDMMMMYYYY {
    return @"cccc, dd MMMM yyyy";
}

+ (NSString *)mk_dateFormatDDMMMYYYY {
    return @"dd MMM yyyy";
}

+ (NSString *)mk_dateFormatDDMMYYYYDashed {
    return @"dd-MM-yyyy";
}

+ (NSString *)mk_dateFormatDDMMYYYYSlashed {
   return @"dd/MM/yyyy";
}

+ (NSString *)mk_dateFormatDDMMMYYYYSlashed {
    return @"dd/MMM/yyyy";
}

+ (NSString *)mk_dateFormatMMMDDYYYY {
    return @"MMM dd, yyyy";
}

+ (NSString *)mk_dateFormatYYYYMMDDDashed {
    return @"yyyy-MM-dd";
}

- (NSString *)mk_formattedString {
    return [self mk_formattedStringUsingFormat:[NSDate mk_dateFormatDDMMYYYYDashed]];
}

- (NSString *)mk_formattedStringUsingFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    NSString *result = [formatter stringFromDate:self];
    return result;
}

@end
