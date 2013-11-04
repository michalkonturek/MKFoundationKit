//
//  NSString+MK_Empty.h
//  MKFoundation
//
//  Created by Michal Konturek on 23/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MK_Empty)

+ (BOOL)MK_isStringEmptyOrNil:(NSString *)value;

- (BOOL)MK_containsString:(NSString *)term caseSensitive:(BOOL)caseSensitive;
- (BOOL)MK_isEmpty;
- (NSString *)MK_trimmedString;

- (NSString *)MK_firstComponent:(NSCharacterSet *)separators;
- (NSString *)MK_lastComponent:(NSCharacterSet *)separators;
- (NSString *)MK_componentAtIndex:(NSInteger)index usingSeparators:(NSCharacterSet *)separators;

@end
