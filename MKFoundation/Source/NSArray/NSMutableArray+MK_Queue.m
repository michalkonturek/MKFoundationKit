//
//  NSMutableArray+MK_Queue.m
//  MKFoundation
//
//  Created by Michal Konturek on 14/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSMutableArray+MK_Queue.h"

@implementation NSMutableArray (MK_Queue)

- (void)MK_enqueueObject:(id)object {
    [self addObject:object];
}

- (id)MK_dequeueObject {
    if ([self MK_isEmpty]) return nil;
    
    id lastObject = [self MK_firstObject];
    [self removeObjectAtIndex:0];
    return lastObject;
}

@end
