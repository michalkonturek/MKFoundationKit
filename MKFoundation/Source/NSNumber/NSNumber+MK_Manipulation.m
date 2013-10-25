//
//  NSNumber+MK_Manipulation.m
//  MKFoundationKit
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSNumber+MK_Manipulation.h"

#import "NSNumber+MK_Creation.h"

@implementation NSNumber (MK_Manipulation)

- (instancetype)MK_add:(NSNumber *)other {
    if (!other) return self;
    return [[self MK_decimalNumber] decimalNumberByAdding:[other MK_decimalNumber]];
}

- (instancetype)MK_subtract:(NSNumber *)other {
    if (!other) return self;
    return [[self MK_decimalNumber] decimalNumberBySubtracting:[other MK_decimalNumber]];
}

- (instancetype)MK_multiplyBy:(NSNumber *)other {
    if (!other) return self;
    return [[self MK_decimalNumber] decimalNumberByMultiplyingBy:[other MK_decimalNumber]];
}

- (instancetype)MK_divideBy:(NSNumber *)other {
    if (!other) return self;
    return [[self MK_decimalNumber] decimalNumberByDividingBy:[other MK_decimalNumber]];
}

- (instancetype)MK_raiseToPower:(NSInteger)power {
    if (power < 0) return [self _raiseToNegativePower:power];
    return [[self MK_decimalNumber] decimalNumberByRaisingToPower:power];
}

- (instancetype)_raiseToNegativePower:(NSInteger)power {

    /*
     source:
     http://stackoverflow.com/questions/3596060/raise-an-nsdecimalnumber-to-a-negative-power
     
     a^(-b) == 1 / (a^b)
     */
    
    power = power * (-1);
    
    id result = [self MK_raiseToPower:power];
    return [[NSDecimalNumber one] MK_divideBy:result];
}

@end
