//
//  NSString+MK_Empty.h
//  MKFoundation
//
//  Created by Michal Konturek on 23/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

#define allTrim(object) [object stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]

@interface NSString (MK_Empty)

+ (BOOL)isStringEmptyOrNil:(NSString *)value;

- (BOOL)isEmpty;

@end
