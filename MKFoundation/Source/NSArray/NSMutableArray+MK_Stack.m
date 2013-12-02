//
//  NSMutableArray+MK_Stack.m
//  MKFoundation
//
//  Created by Michal Konturek on 13/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSMutableArray+MK_Stack.h"

@implementation NSMutableArray (MK_Stack)

- (void)mk_pushObject:(id)object {
    [self insertObject:object atIndex:0];
}

- (id)mk_pullObject {
    if ([self mk_isEmpty]) return nil;

    id firstObject = [self mk_firstObject];
    [self removeObject:firstObject];
    return firstObject;
}

@end
