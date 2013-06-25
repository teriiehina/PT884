//
//  main.m
//  PT884
//
//  Created by Peter MEUEL on 24/06/13.
//  Copyright (c) 2013 Peter MEUEL. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PTUniqueDigitNumber.h"
#import "PT884Validator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        PTUniqueDigitNumber *number = [[PTUniqueDigitNumber alloc] init];

        number.startNumber = @(12345678);
        number.endNumber   = @(98765432);
        
        NSNumber *aNumber = number.startNumber;
        
        NSLog(@"searching");
        
        BOOL isSolution = [PT884Validator numberSolvesPT884:aNumber];
        
        while ( ! isSolution)
        {
            aNumber     = [number nextNumber];
            isSolution  = [PT884Validator numberSolvesPT884:aNumber];
        }
        
        if (isSolution)
        {
            NSLog(@"the solution is %@" , aNumber);
            [PT884Validator printVerificationForNumber:aNumber];
        }
        else
        {
            NSLog(@"didn't find anything.");
        }
    }
    
    return 0;
}