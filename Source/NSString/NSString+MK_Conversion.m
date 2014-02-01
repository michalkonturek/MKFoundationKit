//
//  NSString+MK_Conversion.m
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSString+MK_Conversion.h"

@implementation NSString (MK_Conversion)

- (NSNumber *)mk_numberWithInteger {
    @try {
        return [NSNumber numberWithInteger:[self integerValue]];
    }
    @catch (NSException *exception) {
        return nil;
    }
}

- (NSNumber *)mk_numberWithLongLong {
    @try {
        return [NSNumber numberWithLongLong:[self longLongValue]];
    }
    @catch (NSException *exception) {
        return nil;
    }
}

@end
