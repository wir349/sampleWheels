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


@end

NS_ASSUME_NONNULL_END
