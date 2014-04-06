//
//  NSObject+MK_AutoDescribe_Tests.m
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

#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest.h>

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
