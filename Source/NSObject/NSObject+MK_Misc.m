//
//  NSObject+MK_Misc.m
//  MKFoundationKit
//
//  Created by Michal Konturek on 21/02/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import "NSObject+MK_Misc.h"

@implementation NSObject (MK_Misc)

- (BOOL)mk_exists {
    return (self != [NSNull null]);
}

@end
