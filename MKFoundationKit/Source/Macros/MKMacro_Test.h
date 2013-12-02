//
//  MKMacro_Test.h
//  MKFoundation
//
//  Created by Michal Konturek on 27/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#define TEST_PASSES assertThatBool(YES, equalToBool(YES));
#define TEST_FAILS  XCTFail(@"Test not implemented.");
#define TEST_NOT_IMPLEMENTED STFail(@"Test not implemented.");


