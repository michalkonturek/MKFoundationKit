//
//  TestDummy.h
//  MKDebugKit
//
//  Created by Michal Konturek on 20/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestDummy : NSObject

+ (instancetype)create;

@property (nonatomic, strong) NSString *propertyString;
@property (nonatomic, strong) NSNumber *propertyNumber;
@property (nonatomic, assign) NSInteger propertyInteger;

- (void)method_no_parameter;
- (void)method_one_parameter:(NSString *)parameter;

@end
