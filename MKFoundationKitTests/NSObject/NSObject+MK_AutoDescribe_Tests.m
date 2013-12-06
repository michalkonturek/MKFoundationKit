//
//  NSObject+MK_AutoDescribe_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 20/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

#import "TestDummy.h"

@interface NSObject_MK_AutoDescribe_Tests : XCTestCase

@property (nonatomic, strong) TestDummy *test_dummy;

@end

@implementation NSObject_MK_AutoDescribe_Tests

- (void)setUp {
    [super setUp];
    self.test_dummy = [TestDummy create];
}

- (void)tearDown {
    self.test_dummy = nil;
    [super tearDown];
}

- (void)test_propertyList {
    NSArray *result = [TestDummy mk_propertyList];
    
    assertThat(result, hasCountOf(3));
    assertThat(result, containsInAnyOrder(@"propertyNumber", @"propertyString", @"propertyInteger", nil));
    
    [[TestDummy create] mk_printObject];
}

- (void)test_methodListOnly {
    NSArray *result = [TestDummy mk_methodListOnly];
    
    assertThat(result, hasCountOf(2));
    assertThat(result, containsInAnyOrder(@"method_no_parameter",
                                          @"method_one_parameter:",
                                          nil));
    
    [[TestDummy create] mk_printObjectMethodsOnly];
}

- (void)test_methodList {
    NSArray *result = [TestDummy mk_methodList];
    
    assertThat(result, hasCountOf(9));
    assertThat(result, containsInAnyOrder(@"method_no_parameter",
                                          @"method_one_parameter:",
                                          @".cxx_destruct",
                                          @"setPropertyInteger:",
                                          @"setPropertyNumber:",
                                          @"setPropertyString:",
                                          @"propertyInteger",
                                          @"propertyNumber",
                                          @"propertyString",
                                          nil));
    
    [[TestDummy create] mk_printObjectMethods];
}

@end
