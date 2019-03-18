//
//  RemoteProfileData.h
//  SampleWheels
//
//  Created by Waleed Rahman on 3/16/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserProfile.h"

NS_ASSUME_NONNULL_BEGIN

@interface RemoteProfileData : NSObject

- (void) saveProfile:(UserProfile *)profile;
- (UserProfile *)getProfileForUserId:(NSString *) userId;

- (void) updateFirstName:(NSString *)firstName forUserId:(NSString *)userId;
- (void) updateLastName:(NSString *)lastName forUserId:(NSString *)userId;
- (void) updateEmail:(NSString *)email forUserId:(NSString *)userId;
- (void) updatePhoneNumber:(NSString *)number forUserId:(NSString *)userId;
- (void) updateImage:(UIImage *)image forUserId:(NSString *)userId;


@end

NS_ASSUME_NONNULL_END
