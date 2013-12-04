//
//  NSArray+LINQ_Sets.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 23/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

@implementation NSArray (LINQ_Sets)

- (instancetype)linq_distinct {
    if ([self count] == 0) return self;
    return [[[NSOrderedSet orderedSetWithArray:self] array] mutableCopy];
    
    /*
     NOTE: The following statement does not maintain order:
     return [self valueForKeyPath:@"@distinctUnionOfObjects.self"];
     */
}

- (instancetype)linq_except:(NSArray *)other {
    if ([self _isEmpty]) return self;
    if (!other) return self;
    if ([other _isEmpty]) return self;
    
    NSMutableArray *result = [NSMutableArray arrayWithArray:self];
    for (id item in other) {
        [result removeObject:item];
    }
    return result;
}

- (instancetype)linq_intersect:(NSArray *)other {
    if ([self _isEmpty]) return self;
    if (!other) return self;
    if ([other _isEmpty]) return self;
    
    NSMutableOrderedSet *result = [NSMutableOrderedSet orderedSetWithArray:self];
    [result intersectOrderedSet:[NSOrderedSet orderedSetWithArray:other]];
    return [[result array] mutableCopy];
}

- (NSArray *)linq_union:(NSArray *)other {
    if ([self _isEmpty]) return other;
    if (!other) return self;
    if ([other _isEmpty]) return self;
    
    NSMutableOrderedSet *result = [NSMutableOrderedSet orderedSetWithArray:self];
    [result unionOrderedSet:[NSOrderedSet orderedSetWithArray:other]];
    return [[result array] mutableCopy];
}

- (BOOL)_isEmpty {
    return ([self count] == 0);
}

@end
