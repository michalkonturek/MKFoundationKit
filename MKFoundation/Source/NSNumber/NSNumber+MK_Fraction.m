//
//  NSNumber+MK_Fraction.m
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSNumber+MK_Fraction.h"

#import "NSNumber+MK_Creation.h"

@implementation NSNumber (MK_Fraction)

- (instancetype)integralPart {
    if ([self isMemberOfClass:[NSNumber class]])
        return [[self class] numberWithInteger:[self integerValue]];
    
    return [[[self class] numberWithInteger:[self integerValue]] decimalNumber];
//    return [self decimalNumberWithPrecision:0];   // do not use as it rounds the number
}

- (instancetype)fractionalPart {
    NSDecimalNumber *integerPart = [[self integralPart] decimalNumber];
    return [[self decimalNumber] decimalNumberBySubtracting:integerPart];
}

- (BOOL)isInteger {
    return ([[self fractionalPart] isEqualToNumber:@0]);
}

- (BOOL)isFraction {
    return (![self isInteger]);
}

@end
