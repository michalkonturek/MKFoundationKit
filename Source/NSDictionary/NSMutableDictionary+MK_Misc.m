//
//  NSMutableDictionary+MK.m
//  MKFoundation
//
//  Created by Michal Konturek on 25/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSMutableDictionary+MK_Misc.h"

@implementation NSMutableDictionary (MK_Misc)

- (void)mk_safeSetObject:(id)object forKey:(id)key {
    if (!key || !object) return;
    [self setObject:object forKey:key];
}

@end
