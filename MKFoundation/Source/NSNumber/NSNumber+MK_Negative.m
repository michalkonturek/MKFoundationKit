//
//  NSNumber+MK_Negative.m
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSNumber+MK_Negative.h"

#import "NSNumber+MK_Creation.h"

@implementation NSNumber (MK_Negative)

+ (instancetype)minus_one {
    return [[NSDecimalNumber zero] decimalNumberBySubtracting:[NSDecimalNumber one]];
}

- (instancetype)negative {
    return ([self isNegative]) ? self : [self negate];
}

- (instancetype)positive {
    return ([self isPositive]) ? self : [self negate];
}

- (instancetype)negate {    
    return [[self decimalNumber] decimalNumberByMultiplyingBy:[NSDecimalNumber minus_one]];
}

- (BOOL)isPositive {
    return (![self isNegative]);
}

- (BOOL)isNegative {
    return ([self doubleValue] < 0);
}

@end
