//
//  ValidationHelper.h
//  SampleWheels
//
//  Created by Waleed Rahman on 3/17/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
    //TODO: This would probably be better as a category
@interface ValidationHelper : NSObject

+ (BOOL) isTextEmpty:(NSString *) text;

+ (BOOL) textContainsValidEmail:(NSString *) text;

+ (BOOL) doesTextContainNumbers:(NSString *) text;

+ (BOOL) doesTextContainOnlyNumbers:(NSString *) text;

+ (BOOL) textContainsValidPhone:(NSString *) text;

@end

NS_ASSUME_NONNULL_END
