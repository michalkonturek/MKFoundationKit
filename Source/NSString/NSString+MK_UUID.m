//
//  NSString+MK_UUID.m
//  MKFoundation
//
//  Created by Michal Konturek on 25/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSString+MK_UUID.h"

@implementation NSString (MK_UUID)

+ (NSString *)mk_stringWithUUID {
    CFUUIDRef UUID = CFUUIDCreate(nil);
    
    // http://stackoverflow.com/questions/7036350/arc-and-bridged-cast
    NSString *result = (NSString *)CFBridgingRelease(CFUUIDCreateString(nil, UUID));
//    NSString *result = (__bridge_transfer NSString *)CFUUIDCreateString(nil, UUID);
    
    CFRelease(UUID);
    
    return result;
}

@end
