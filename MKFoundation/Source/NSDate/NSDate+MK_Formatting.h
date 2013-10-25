//
//  NSDate+MK_Formatting.h
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK.h"

@interface NSDate (MK_Formatting)

+ (NSString *)MK_dateFormatCCCCDDMMMYYYY;
+ (NSString *)MK_dateFormatCCCCDDMMMMYYYY;

+ (NSString *)MK_dateFormatDDMMMYYYY;
+ (NSString *)MK_dateFormatDDMMYYYYDashed;
+ (NSString *)MK_dateFormatDDMMYYYYSlashed;

+ (NSString *)MK_dateFormatDDMMMYYYYSlashed;
+ (NSString *)MK_dateFormatMMMDDYYYY;
+ (NSString *)MK_dateFormatYYYYMMDDDashed;

- (NSString *)MK_formattedString;
- (NSString *)MK_formattedStringUsingFormat:(NSString *)dateFormat;

@end
