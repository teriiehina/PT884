//
//  main.m
//  PT884
//
//  Created by Peter MEUEL on 24/06/13.
//  Copyright (c) 2013 Peter MEUEL. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PTUniqueDigitNumber.h"

BOOL numberSolvesPT884_version1(NSNumber *number);
BOOL numberSolvesPT884_version2(NSNumber *number);

int beginnigOfStringAsInt(NSString *string , int toIndex);
int unicharAsIntValue(unichar c);

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        PTUniqueDigitNumber *number = [[PTUniqueDigitNumber alloc] init];

        number.startNumber = @(123456789);
        number.endNumber   = @(987654321);
        
        NSNumber *aNumber = number.startNumber;
        
        NSLog(@"searching");
        
        BOOL isSolution = numberSolvesPT884_version2(aNumber);
        
        while ( ! isSolution)
        {
            aNumber     = [number nextNumber];
            isSolution  = numberSolvesPT884_version2(aNumber);
        }
        
        if (isSolution)
        {
            NSLog(@"the solution is %@" , aNumber);
        }
        else
        {
            NSLog(@"didn't find anything.");
        }
    }
    
    return 0;
}

BOOL numberSolvesPT884_version1(NSNumber *number)
{
    int value;
    NSString *substring;
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

BOOL numberSolvesPT884_version2(NSNumber *number)
{
    int value;
    NSString *string        = number.description;
    NSUInteger numberLength = number.description.length;
    
    for (int length = 1; length <= numberLength; length++)
    {        
        value = beginnigOfStringAsInt(string , length);
        NSLog(@"%@ -> %d , %d = %d" , number , value , length , value % length);
        if (value % length != 0)
        {
            return NO;
        }
    }
    
    return YES;
}

int beginnigOfStringAsInt(NSString *string , int toIndex)
{
    int value = 0;
    unichar c;
    
    for (int index = 0; index < toIndex; index++)
    {
        c = [string characterAtIndex:index];
        c = unicharAsIntValue(c);
        
        value += c * pow(10, toIndex - index - 1);
    }
    
    return value;
}

int unicharAsIntValue(unichar c)
{
    return c-48;
}

