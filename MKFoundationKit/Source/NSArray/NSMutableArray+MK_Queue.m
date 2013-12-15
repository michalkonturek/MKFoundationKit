//
//  NSMutableArray+MK_Queue.m
//  MKFoundation
//
//  Created by Michal Konturek on 14/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSMutableArray+MK_Queue.h"

@implementation NSMutableArray (MK_Queue)

- (void)mk_enqueueObject:(id)object {
    [self addObject:object];
}

- (id)mk_dequeueObject {
    if ([self count] == 0) return nil;
    
    id firstObject = [self objectAtIndex:0];
    [self removeObjectAtIndex:0];
    return firstObject;
}

@end
