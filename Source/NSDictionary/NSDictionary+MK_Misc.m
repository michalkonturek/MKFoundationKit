//
//  NSDictionary+MK_Misc.m
//  MKFoundationKit
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

#import "NSDictionary+MK.h"

@implementation NSDictionary (MK_Misc)

- (NSMutableDictionary *)mk_dictionaryWithKeys:(NSArray *)keys {
    if ([keys count] == 0) return [NSMutableDictionary dictionary];
    
    id result = [NSMutableDictionary dictionaryWithCapacity:[keys count]];
    for (NSString *key in keys) {
        id object = [self objectForKey:key];
        if (key != nil) {
            [result setObject:object forKey:key];
        }
    }
    
    return result;
}

- (NSMutableDictionary *)mk_renameKeysUsingMapping:(NSDictionary *)mapping {
    id result = [NSMutableDictionary dictionaryWithDictionary:self];
    
    id object = nil;
    NSString *newKey = nil;
    for (NSString *key in mapping) {
        object = [result objectForKey:key];
        newKey = [mapping objectForKey:key];
        if (object != nil) {
            [result removeObjectForKey:key];
            [result setObject:object forKey:newKey];
        }
    }
    
    return result;
}

- (BOOL)mk_isEmpty {
    return ([self count] == 0);
}

@end
