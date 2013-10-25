//
//  NSMutableDictionary+MK.m
//  MKFoundation
//
//  Created by Michal Konturek on 25/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSMutableDictionary+MK.h"

@implementation NSMutableDictionary (MK)

- (void)MK_safeSetObject:(id)object forKey:(id)key {
    if (!key || !object) return;
    [self setObject:object forKey:key];
}

@end
