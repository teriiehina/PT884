//
//  PTUniqueDigitNumber.m
//  PT884
//
//  Created by Peter MEUEL on 24/06/13.
//  Copyright (c) 2013 Peter MEUEL. All rights reserved.
//

#import "PTUniqueDigitNumber.h"

static int occurrences[10] = {0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0};

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

- (void)setStartNumber:(NSNumber *)startNumber
{
    _startNumber        = startNumber;
    self.currentNumber  = startNumber;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id [])buffer count:(NSUInteger)bufferSize
{    
    NSUInteger arrayIndex  = (NSUInteger)state->state;
    NSUInteger bufferIndex = 0;
    
    while ( (bufferIndex < bufferSize) && (self.currentNumber.intValue <= self.endNumber.intValue))
    {
        self.currentNumber = [self nextNumber];
        buffer[bufferIndex] = self.currentNumber;
        arrayIndex++;
        bufferIndex++;
    }
    
    state->state        = (unsigned long)arrayIndex;
    state->itemsPtr     = buffer;
    state->mutationsPtr = &state->extra[0];
    
    return bufferIndex;

    
    return 1;
}

- (NSNumber *)nextNumber
{
    int current = self.currentNumber.intValue;
    
    BOOL isValid = NO;
    
    while ( ! isValid )
    {
        isValid = [self isUniqueDigit:@(++current)];
    }
    
    self.currentNumber = @(current);
    
    return @(current);
}

// TODO: find a more efficient way to do this computation
- (BOOL)isUniqueDigit:(NSNumber *)number
{        
    int bufferSize      = 32;
    NSString *aString   = number.description;
    
    occurrences[0] = 0;
    occurrences[1] = 0;
    occurrences[2] = 0;
    occurrences[3] = 0;
    occurrences[4] = 0;
    occurrences[5] = 0;
    occurrences[6] = 0;
    occurrences[7] = 0;
    occurrences[8] = 0;
    occurrences[9] = 0;

    NSRange range       = { 0, bufferSize };
    NSUInteger end      = [aString length];
    
    while (range.location < end)
    {
        unichar buffer[bufferSize];
        
        if (range.location + range.length > end)
        {
            range.length = end - range.location;
        }
        
        [aString getCharacters:buffer range:range];
        range.location += bufferSize;
        
        for (unsigned i=0 ; i<range.length ; i++)
        {
            unichar c = buffer[i] - 48;

            NSAssert(c >= 0, @"we should not have negative index here");
            NSAssert(c <= 9, @"we should not have double-digits index here");

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
