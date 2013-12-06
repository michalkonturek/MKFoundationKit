//
//  NSData+MK_Base64_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 26/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

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
