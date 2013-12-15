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
    if ([self count] == 0) return nil;
    
    id firstObject = [self objectAtIndex:0];
    [self removeObjectAtIndex:0];
    return firstObject;
}

@end
