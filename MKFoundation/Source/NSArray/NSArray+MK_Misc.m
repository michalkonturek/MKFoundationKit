//
//  NSArray+MK_Misc.m
//  MKFoundation
//
//  Created by Michal Konturek on 10/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+MK_Misc.h"

@implementation NSArray (MK_Misc)

- (BOOL)MK_isEmpty {
    return ([self count] == 0);
}

- (id)MK_firstObject {
    if ([self MK_isEmpty]) return nil;
    return [self objectAtIndex:0];
}

@end
