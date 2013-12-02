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
