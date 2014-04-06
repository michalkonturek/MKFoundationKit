//
//  NSData+MK_Base64_Tests.m
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

@interface NSData_MK_Base64_Tests : XCTestCase

@end

@implementation NSData_MK_Base64_Tests

- (void)test_base64EncodingAndDecoding_when_input_none {
    NSString *input = @"";
    NSString *result = [input mk_base64EncodedString];
    assertThat(result, nilValue());
}

- (void)test_base64EncodingAndDecoding_when_input_01 {
    NSString *decoded = @"1";
    NSString *encoded = @"MQ==";
    
    assertThat([[NSData mk_dataWithBase64EncodedString:encoded] mk_base64EncodedString],
               equalTo(encoded));
    
    assertThat([[decoded mk_base64EncodedData] mk_base64DecodedString],
               equalTo(decoded));
}

- (void)test_base64EncodingAndDecoding_when_input_02 {
    NSString *decoded = @"12";
    NSString *encoded = @"MTI=";
    
    assertThat([[NSData mk_dataWithBase64EncodedString:encoded] mk_base64EncodedString],
               equalTo(encoded));
    
    assertThat([[decoded mk_base64EncodedData] mk_base64DecodedString],
               equalTo(decoded));
}

- (void)test_base64EncodingAndDecoding_when_input_10 {
    NSString *decoded = @"1234567890";
    NSString *encoded = @"MTIzNDU2Nzg5MA==";
    
    assertThat([[NSData mk_dataWithBase64EncodedString:encoded] mk_base64EncodedString],
               equalTo(encoded));
    
    assertThat([[decoded mk_base64EncodedData] mk_base64DecodedString],
               equalTo(decoded));
}

- (void)test_base64EncodingAndDecoding_when_input_11 {
    NSString *decoded = @"1234567890A";
    NSString *encoded = @"MTIzNDU2Nzg5MEE=";
    
    assertThat([[NSData mk_dataWithBase64EncodedString:encoded] mk_base64EncodedString],
               equalTo(encoded));
    
    assertThat([[decoded mk_base64EncodedData] mk_base64DecodedString],
               equalTo(decoded));
}

- (void)test_base64EncodingAndDecoding_when_input_12 {
    NSString *decoded = @"Test input A";
    NSString *encoded = @"VGVzdCBpbnB1dCBB";
    
    assertThat([[NSData mk_dataWithBase64EncodedString:encoded] mk_base64EncodedString],
               equalTo(encoded));
    
    assertThat([[decoded mk_base64EncodedData] mk_base64DecodedString],
               equalTo(decoded));
}

@end
