//
//  NSMutableArray+MK_Misc
//  MKFoundation
//
//  Created by Michal Konturek on 25/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSMutableArray+MK_Misc.h"

@implementation NSMutableArray (MK_Misc)

- (void)mk_safeAddObject:(id)object {
    if (!object) return;
    [self addObject:object];
}

@end
