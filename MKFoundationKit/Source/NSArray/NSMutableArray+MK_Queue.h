//
//  NSMutableArray+MK_Queue.h
//  MKFoundation
//
//  Created by Michal Konturek on 14/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (MK_Queue)

- (void)mk_enqueueObject:(id)object;
- (id)mk_dequeueObject;

@end
