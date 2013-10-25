//
//  NSNumber+MK_Negative.m
//  MKFoundationKit
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSNumber+MK_Negative.h"

#import "NSNumber+MK_Creation.h"

@implementation NSNumber (MK_Negative)

+ (instancetype)MK_minus_one {
    return [[NSDecimalNumber zero] decimalNumberBySubtracting:[NSDecimalNumber one]];
}

- (instancetype)MK_negative {
    return ([self MK_isNegative]) ? self : [self MK_negate];
}

- (instancetype)MK_positive {
    return ([self MK_isPositive]) ? self : [self MK_negate];
}

- (instancetype)MK_negate {    
    return [[self MK_decimalNumber] decimalNumberByMultiplyingBy:[NSDecimalNumber MK_minus_one]];
}

- (BOOL)MK_isPositive {
    return (![self MK_isNegative]);
}

- (BOOL)MK_isNegative {
    return ([self doubleValue] < 0);
}

@end
