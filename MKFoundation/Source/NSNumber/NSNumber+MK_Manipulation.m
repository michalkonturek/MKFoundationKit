//
//  NSNumber+MK_Manipulation.m
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSNumber+MK_Manipulation.h"

#import "NSNumber+MK_Creation.h"

@implementation NSNumber (MK_Manipulation)

- (instancetype)add:(NSNumber *)other {
    if (!other) return self;
    return [[self decimalNumber] decimalNumberByAdding:[other decimalNumber]];
}

- (instancetype)subtract:(NSNumber *)other {
    if (!other) return self;
    return [[self decimalNumber] decimalNumberBySubtracting:[other decimalNumber]];
}

- (instancetype)multiplyBy:(NSNumber *)other {
    if (!other) return self;
    return [[self decimalNumber] decimalNumberByMultiplyingBy:[other decimalNumber]];
}

- (instancetype)divideBy:(NSNumber *)other {
    if (!other) return self;
    return [[self decimalNumber] decimalNumberByDividingBy:[other decimalNumber]];
}

- (instancetype)raiseToPower:(NSInteger)power {
    if (power < 0) return [self _raiseToNegativePower:power];
    return [[self decimalNumber] decimalNumberByRaisingToPower:power];
}

- (instancetype)_raiseToNegativePower:(NSInteger)power {

    /*
     http://stackoverflow.com/questions/3596060/raise-an-nsdecimalnumber-to-a-negative-power
     
     a^(-b) == 1 / (a^b)
     */
    
    power = power * (-1);
    
    id result = [self raiseToPower:power];
    return [[NSDecimalNumber one] divideBy:result];
}

@end
