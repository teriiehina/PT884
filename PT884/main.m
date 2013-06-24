//
//  main.m
//  PT884
//
//  Created by Peter MEUEL on 24/06/13.
//  Copyright (c) 2013 Peter MEUEL. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PTUniqueDigitNumber.h"

BOOL numberSolvesPT884(NSNumber *number);

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        PTUniqueDigitNumber *number = [[PTUniqueDigitNumber alloc] init];

        number.startNumber = @(123456789);
        number.endNumber   = @(987654321);
        
        NSNumber *aNumber = number.startNumber;
        
        NSLog(@"searching");
        
        BOOL isSolution = NO;
        
        while ( ! isSolution)
        {
            aNumber     = [number nextNumber];
            isSolution  = numberSolvesPT884(aNumber);
        }
        
//        for (NSNumber *uniq in number)
//        {
//            if (numberSolvesPT884(uniq))
//            {
//                NSLog(@"the answer is: %@" , uniq);
//                return 0;
//            }
//        }
        
        NSLog(@"didn't find anything.");
        
    }
    return 0;
}

BOOL numberSolvesPT884(NSNumber *number)
{
    NSString *substring;
    int value;
    
    NSUInteger numberLength = number.description.length;
    
    for (int length = 1; length <= numberLength; length++)
    {
        substring = [number.description substringToIndex:length];
        
        value = substring.intValue;
        if (value % length != 0)
        {
            return NO;
        }
    }
    
    return YES;
}

