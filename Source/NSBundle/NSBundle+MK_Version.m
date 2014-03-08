//
//  NSBundle+MK_Version.m
//  MKFoundationKit
//
//  Created by Michal Konturek on 07/03/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import "NSBundle+MK_Version.h"

@implementation NSBundle (MK_Version)

/*
 source:
 https://developer.apple.com/library/ios/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html#
 */

- (NSString *)mk_build {
    return [self mk_infoForKey:@"CFBundleVersion"];
}

- (NSString *)mk_name {
    return [self mk_infoForKey:@"CFBundleName"];
}

- (NSString *)mk_version {
    return [self mk_infoForKey:@"CFBundleShortVersionString"];
}

- (NSString *)mk_infoForKey:(id)key {
    return [[self infoDictionary] objectForKey:key];
}

@end
