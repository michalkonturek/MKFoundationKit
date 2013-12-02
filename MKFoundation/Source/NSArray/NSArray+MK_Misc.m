//
//  NSArray+MK_Misc.m
//  MKFoundation
//
//  Created by Michal Konturek on 10/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+MK_Misc.h"

@implementation NSArray (MK_Misc)

- (BOOL)mk_isEmpty {
    return ([self count] == 0);
}

- (id)mk_firstObject {
    if ([self mk_isEmpty]) return nil;
    return [self objectAtIndex:0];
}

@end
