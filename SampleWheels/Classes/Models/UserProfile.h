//
//  UserProfile.h
//  SampleWheels
//
//  Created by Waleed Rahman on 3/15/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserProfile: NSObject

@property(nonatomic) NSInteger userId;
@property(nonatomic, retain) NSString * email;
@property(nonatomic, retain) NSString * firstName;
@property(nonatomic, retain) NSString * lastName;
@property(nonatomic, retain) NSString * phone;


////@property (nonatomic, retain)  NSString * invitationCode;
//@property (NS_NONATOMIC_IOSONLY, copy) NSString * firstName;
//@property (NS_NONATOMIC_IOSONLY, copy) NSString * lastName;
//@property (NS_NONATOMIC_IOSONLY, copy) NSString * email;
//@property (NS_NONATOMIC_IOSONLY, copy) NSString * phone;

-(id)initWithDictionary:(NSDictionary *)userDictionary;

-(id)initWithUserId:(NSDictionary *)userDictionary;

//+(UserModel*) getSignedInUser;


@end

NS_ASSUME_NONNULL_END
