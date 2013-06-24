//
//  PT884_Tests.m
//  PT884 Tests
//
//  Created by Peter MEUEL on 24/06/13.
//  Copyright (c) 2013 Peter MEUEL. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "PTUniqueDigitNumber.h"

@interface PT884_Tests : XCTestCase

@property (nonatomic , strong) PTUniqueDigitNumber *number;

@end

@implementation PT884_Tests

- (void)setUp
{
    [super setUp];
    
    self.number = [[PTUniqueDigitNumber alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testUniqueDigitNumberFromOne
{
    self.number.currentNumber = @(1);
    XCTAssertEqualObjects([self.number nextNumber], @(2), @"The next unique digit number after 1 shoul be 2");
}

- (void)testUniqueDigitNumberFromEleven
{
    self.number.currentNumber = @(10);
    XCTAssertEqualObjects([self.number nextNumber], @(12), @"The next unique digit number after 10 shoul be 12");
}

- (void)testUniqueDigitNumberFromTwentyOne
{
    self.number.currentNumber = @(21);
    XCTAssertEqualObjects([self.number nextNumber], @(23), @"The next unique digit number after 21 shoul be 23");
}

@end
