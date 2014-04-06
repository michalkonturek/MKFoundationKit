//
//  NSString+MK_Misc.h
//  MKFoundation
//
//  Copyright (c) 2013 Michal Konturek
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
