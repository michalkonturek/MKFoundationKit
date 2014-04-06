//
//  NSString+MK_Misc.m
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

#import "NSString+MK_Misc.h"

@implementation NSString (MK_Misc)

- (NSString *)mk_firstComponentUsingSeparators:(NSCharacterSet *)separators {
    return [self mk_componentAtIndex:0 usingSeparators:separators];
}

- (NSString *)mk_lastComponentUsingSeparators:(NSCharacterSet *)separators {
    NSArray *components = [self componentsSeparatedByCharactersInSet:separators];
    return (components.count == 1) ? @"" : [components lastObject];
}

- (NSString *)mk_componentAtIndex:(NSInteger)index usingSeparators:(NSCharacterSet *)separators {
    if (index < 0) return @"";
    
    NSArray *components = [self componentsSeparatedByCharactersInSet:separators];
    if ([components count] == 1) return @"";
    if ([components count] <= index) return @"";
    
    return [components objectAtIndex:index];
}

- (BOOL)mk_containsString:(NSString *)term caseSensitive:(BOOL)caseSensitive {
    NSString *target = (caseSensitive) ? self : [self lowercaseString];
    NSString *searchTerm = (caseSensitive) ? term : [term lowercaseString];
    NSRange range = [target rangeOfString:searchTerm];
    return (range.location != NSNotFound);
}

- (NSInteger)mk_countOccurencesOfString:(NSString *)term {
    return [self mk_countOccurencesOfString:term caseSensitive:YES];
}

- (NSInteger)mk_countOccurencesOfString:(NSString *)term caseSensitive:(BOOL)caseSensitive {
    return [self mk_countOccurencesOfStrings:@[term] caseSensitive:caseSensitive];
}

- (NSInteger)mk_countOccurencesOfStrings:(NSArray *)terms {
    return [self mk_countOccurencesOfStrings:terms caseSensitive:YES];
}

- (NSInteger)mk_countOccurencesOfStrings:(NSArray *)terms caseSensitive:(BOOL)caseSensitive {
    NSInteger result = 0;
    
    NSRegularExpressionOptions option = (caseSensitive) ? 0 : NSRegularExpressionCaseInsensitive;
    
    for (id item in terms) {
        NSError *error = nil;
        id regex = [NSRegularExpression regularExpressionWithPattern:item
                                                             options:option
                                                               error:&error];
        
        result += [regex numberOfMatchesInString:self options:0 range:[self mk_range]];
    }
    
    return result;
}

- (NSRange)mk_range {
    return [self rangeOfString:self];
}

//- (NSInteger)countOccurencesOfCharacters:(NSArray *)characters {
//    NSInteger result = 0;
//    
//    for (id item in characters) {
//        NSString *cleared = [self stringByReplacingOccurrencesOfString:item withString:@""];
//        NSInteger count = ([self length] - [cleared length]);
//        result += count;
//    }
//    
//    return result;
//}

@end
