//
//  PT884Validator.h
//  PT884
//
//  Created by Peter MEUEL on 25/06/13.
//  Copyright (c) 2013 Peter MEUEL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PT884Validator : NSObject

+ (BOOL)numberSolvesPT884:(NSNumber *)number;
+ (void)printVerificationForNumber:(NSNumber *)number;

@end
