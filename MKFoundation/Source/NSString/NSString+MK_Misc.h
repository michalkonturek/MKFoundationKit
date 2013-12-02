//
//  NSString+MK_Misc.h
//  MKFoundation
//
//  Created by Michal Konturek on 04/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MK_Misc)

- (NSString *)mk_firstComponentUsingSeparators:(NSCharacterSet *)separators;
- (NSString *)mk_lastComponentUsingSeparators:(NSCharacterSet *)separators;
- (NSString *)mk_componentAtIndex:(NSInteger)index usingSeparators:(NSCharacterSet *)separators;

- (BOOL)mk_containsString:(NSString *)term caseSensitive:(BOOL)caseSensitive;

- (NSInteger)mk_countOccurencesOfString:(NSString *)term;
- (NSInteger)mk_countOccurencesOfString:(NSString *)term caseSensitive:(BOOL)caseSensitive;

- (NSInteger)mk_countOccurencesOfStrings:(NSArray *)terms;
- (NSInteger)mk_countOccurencesOfStrings:(NSArray *)terms caseSensitive:(BOOL)caseSensitive;

- (NSRange)mk_range;

@end
