//
//  PTUniqueDigitNumber.m
//  PT884
//
//  Created by Peter MEUEL on 24/06/13.
//  Copyright (c) 2013 Peter MEUEL. All rights reserved.
//

#import "PTUniqueDigitNumber.h"

@interface PTUniqueDigitNumber ()

- (BOOL)isUniqueDigit:(NSNumber *)number;

@end

@implementation PTUniqueDigitNumber

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    self.currentNumber = @(0);
    
    return self;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id [])buffer count:(NSUInteger)len
{
    return 0;
}

- (NSNumber *)nextNubmer
{
    int current = self.currentNumber.intValue;
    
    BOOL isValid = NO;
    
    while ( ! isValid )
    {
        isValid = [self isUniqueDigit:@(++current)];
    }
    
    return @(current);
}

// TODO: find a more efficient way to do this computation
- (BOOL)isUniqueDigit:(NSNumber *)number
{
//    NSString *string  = [NSString stringWithFormat:@"%d" , number.intValue];
//    NSArray *dividers = @[@"1" , @"2" , @"3" , @"4" , @"5" , @"6" , @"7" , @"8" , @"9"];
//    NSArray *comps;
//
//    for (NSString *divider in dividers)
//    {
//        comps = [string componentsSeparatedByString:@"1"];
//        if (comps.count > 2) return NO;
//    }
//    
//    return YES;
    
    int bufferSize      = 32;
    NSString *aString   = number.description;
    int occurrences[10] = {0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0};
    
    NSRange range       = { 0, bufferSize };
    NSUInteger end      = [aString length];
    
    while (range.location < end)
    {
        unichar buffer[bufferSize];
        if (range.location + range.length > end)
        {
            range.length = end - range.location;
        }
        
        [aString getCharacters: buffer range: range];
        range.location += bufferSize;
        for (unsigned i=0 ; i<range.length ; i++)
        {
            unichar c = buffer[i] - 48;
            NSAssert(c > 0, @"we should not have negative index here");
            NSAssert(c < 10, @"we should not have double-digits index here");

            occurrences[c]++;
        }
    }
    
    for (int i = 0; i <= 9; i++)
    {
        if (occurrences[i] > 1) {
            return NO;
        }
    }
    
    return YES;
}

@end
