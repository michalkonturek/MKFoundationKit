//
//  NSArray+MK_Misc.m
//  MKFoundation
//
//  Created by Michal Konturek on 10/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+MK_Misc.h"

#import "NSArray+MK_Block.h"

@implementation NSArray (MK_Misc)

- (id)mk_firstObject {
    if ([self mk_isEmpty]) return nil;
    return [self objectAtIndex:0];
}

- (id)mk_max {
    if ([self mk_isEmpty]) return [NSDecimalNumber zero];
    
    return [self mk_reduce:^id(id item, id aggregate) {
        return ([item compare:aggregate] == NSOrderedDescending) ? item : aggregate;
    }];
}

- (id)mk_min {
    if ([self mk_isEmpty]) return [NSDecimalNumber zero];
    
    return [self mk_reduce:^id(id item, id aggregate) {
        return ([item compare:aggregate] == NSOrderedAscending) ? item : aggregate;
    }];
}

- (BOOL)mk_isEmpty {
    return ([self count] == 0);
}

@end
