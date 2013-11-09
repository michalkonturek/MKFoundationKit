//
//  NSDate+MK_Formatting.m
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK_Formatting.h"

@implementation NSDate (MK_Formatting)

// resource: http://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns

+ (NSString *)MK_dateFormatCCCCDDMMMYYYY {
    return @"cccc, dd MMM yyyy";
}

+ (NSString *)MK_dateFormatCCCCDDMMMMYYYY {
    return @"cccc, dd MMMM yyyy";
}

+ (NSString *)MK_dateFormatDDMMMYYYY {
    return @"dd MMM yyyy";
}

+ (NSString *)MK_dateFormatDDMMYYYYDashed {
    return @"dd-MM-yyyy";
}

+ (NSString *)MK_dateFormatDDMMYYYYSlashed {
   return @"dd/MM/yyyy";
}

+ (NSString *)MK_dateFormatDDMMMYYYYSlashed {
    return @"dd/MMM/yyyy";
}

+ (NSString *)MK_dateFormatMMMDDYYYY {
    return @"MMM dd, yyyy";
}

+ (NSString *)MK_dateFormatYYYYMMDDDashed {
    return @"yyyy-MM-dd";
}

- (NSString *)MK_formattedString {
    return [self MK_formattedStringUsingFormat:[NSDate MK_dateFormatDDMMYYYYDashed]];
}

- (NSString *)MK_formattedStringUsingFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    NSString *result = [formatter stringFromDate:self];
    return result;
}

@end
