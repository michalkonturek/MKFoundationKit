//
//  NSArray+LINQ_Partitioning.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ_Partitioning.h"

@implementation NSArray (LINQ_Partitioning)

- (NSArray *)linq_skip:(NSInteger)count {
    if (count >= self.count) return [NSArray array];
    NSRange range = NSMakeRange(count, [self count] - count);
    return [self subarrayWithRange:range];
}

- (NSArray *)linq_take:(NSInteger)count {
    if (count >= self.count) return [NSArray array];
    NSInteger length = (count > self.count) ? self.count : count;
    return [self subarrayWithRange:NSMakeRange(0, length)];
}

@end
