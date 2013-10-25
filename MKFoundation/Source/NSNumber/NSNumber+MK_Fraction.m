//
//  NSNumber+MK_Fraction.m
//  MKFoundationKit
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSNumber+MK_Fraction.h"

#import "NSNumber+MK_Creation.h"

@implementation NSNumber (MK_Fraction)

- (instancetype)MK_integralPart {
    if ([self isMemberOfClass:[NSNumber class]])
        return [NSNumber numberWithInteger:[self integerValue]];
    
    return [[NSDecimalNumber numberWithInteger:[self integerValue]] MK_decimalNumber];
//    return [self decimalNumberWithPrecision:0];   // do not use as it rounds the number
}

- (instancetype)MK_fractionalPart {
    NSDecimalNumber *integerPart = [[self MK_integralPart] MK_decimalNumber];
    return [[self MK_decimalNumber] decimalNumberBySubtracting:integerPart];
}

- (BOOL)MK_isInteger {
    return ([[self MK_fractionalPart] isEqualToNumber:@0]);
}

- (BOOL)MK_isFraction {
    return (![self MK_isInteger]);
}

@end
