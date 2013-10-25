//
//  NSString+MK_UTF.h
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MK_UTF)

+ (NSString *)MK_decodeUTF8String:(NSString *)value;

- (NSString *)MK_decodeUTF8;

@end
