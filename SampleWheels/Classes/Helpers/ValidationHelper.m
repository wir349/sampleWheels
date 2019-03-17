//
//  ValidationHelper.m
//  SampleWheels
//
//  Created by Waleed Rahman on 3/17/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import "ValidationHelper.h"

@implementation ValidationHelper

+ (BOOL) isTextEmpty:(NSString *) text {
    if (text == (id)[NSNull null] || text.length == 0 )
        return true;
    return false;
}

+ (BOOL) textContainsValidEmail:(NSString *) text {
        //Create a regex string
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" ;
    
        //Create predicate with format matching your regex string
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:
                              @"SELF MATCHES %@", stricterFilterString];
    
        //return true if email address is valid
    return [emailTest evaluateWithObject:text];
}

+ (BOOL) doesTextContainNumbers:(NSString *) text {
    NSCharacterSet* digits = [NSCharacterSet decimalDigitCharacterSet];
    if ([text rangeOfCharacterFromSet:digits].location == NSNotFound)
        return false;
    return true;
}

+ (BOOL) doesTextContainOnlyNumbers:(NSString *) text {
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([text rangeOfCharacterFromSet:notDigits].location == NSNotFound)
        return true;
    return false;
}

+ (BOOL) textContainsValidPhone:(NSString *) text {
        //Create a regex string
    NSString *stricterFilterString = @"[0-9]{10}" ;
    
        //Create predicate with format matching your regex string
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:
                              @"SELF MATCHES %@", stricterFilterString];
    
        //return true if email address is valid
    return [phoneTest evaluateWithObject:text];
}

@end
