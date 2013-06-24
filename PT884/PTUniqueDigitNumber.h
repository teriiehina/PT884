//
//  PTUniqueDigitNumber.h
//  PT884
//
//  Created by Peter MEUEL on 24/06/13.
//  Copyright (c) 2013 Peter MEUEL. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class can be used to get a number which every digit will be different.
 You can set the currentNumber property to start the enumeration from wherever you want.
 */

@interface PTUniqueDigitNumber : NSObject <NSFastEnumeration>

@property (nonatomic , strong) NSNumber *startNumber;
@property (nonatomic , strong) NSNumber *currentNumber;
@property (nonatomic , strong) NSNumber *endNumber;

- (NSNumber *)nextNumber;


@end
