//
//  NSMutableArray+MK_Stack.h
//  MKFoundation
//
//  Created by Michal Konturek on 13/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (MK_Stack)

- (void)mk_pushObject:(id)object;
- (id)mk_pullObject;

@end
