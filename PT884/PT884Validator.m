//
//  PT884Validator.m
//  PT884
//
//  Created by Peter MEUEL on 25/06/13.
//  Copyright (c) 2013 Peter MEUEL. All rights reserved.
//

#import "PT884Validator.h"

@interface PT884Validator ()

+ (BOOL)numberSolvesPT884_version1:(NSNumber *)number;
+ (BOOL)numberSolvesPT884_version2:(NSNumber *)number;

@end


@implementation PT884Validator

#pragma mark - Public methods

+ (BOOL)numberSolvesPT884:(NSNumber *)number
{
    return [self numberSolvesPT884_version1:number];
}

+ (void)printVerificationForNumber:(NSNumber *)number
{
    int value;
    NSString *string        = number.description;
    NSUInteger numberLength = number.description.length;
    
    for (int length = 1; length <= numberLength; length++)
    {
        value = [self beginnigOfString:string AsIntToIndex:length];
        NSLog(@"%9d = %d * %7d + %d" , value , length , value / length , value % length);
    }    
}

#pragma mark - Private methods

+ (BOOL)numberSolvesPT884_version1:(NSNumber *)number;
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

+ (BOOL)numberSolvesPT884_version2:(NSNumber *)number;
{
    int value;
    NSString *string        = number.description;
    NSUInteger numberLength = number.description.length;
    
    for (int length = 1; length <= numberLength; length++)
    {
        value = [self beginnigOfString:string AsIntToIndex:length];

//        NSLog(@"%@ -> %d , %d = %d" , number , value , length , value % length);
        if (value % length != 0)
        {
            return NO;
        }
    }
    
    return YES;
}

+ (int)beginnigOfString:(NSString *)string AsIntToIndex:(int)toIndex
{
    int value = 0;
    unichar c;
    
    for (int index = 0; index < toIndex; index++)
    {
        c = [string characterAtIndex:index];
        
        // 48 is the unichar code for '0'
        c = c - 48;
        
        value += c * pow(10, toIndex - index - 1);
    }
    
    return value;
}


@end
