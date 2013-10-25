//
//  NSMutableArray+MK
//  MKFoundation
//
//  Created by Michal Konturek on 25/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSMutableArray+MK_SafeAddition.h"

@implementation NSMutableArray (MK)

- (void)mk_safeAddObject:(id)object {
    if (!object) return;
    [self addObject:object];
}

@end
