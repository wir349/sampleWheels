//
//  UserProfile.h
//  SampleWheels
//
//  Created by Waleed Rahman on 3/15/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import <UIKit/UIKit.h>

    //I should be using something better but for now MACROS will do and these should be in a separate file
#define FIRSTNAME @"first_name"
#define LASTNAME @"last_name"
#define EMAIL @"email"
#define PHONE @"phone"
#define PICTURE @"profilePic"



NS_ASSUME_NONNULL_BEGIN

@interface UserProfile: NSObject

@property(nonatomic, copy) NSString * userId;
@property(nonatomic, copy) NSString * email;
@property(nonatomic, copy) NSString * firstName;
@property(nonatomic, copy) NSString * lastName;
@property(nonatomic, copy) NSString * phoneNumber;
@property(nonatomic) UIImage *picture;

////@property (nonatomic, retain)  NSString * invitationCode;
//@property (NS_NONATOMIC_IOSONLY, copy) NSString * firstName;
//@property (NS_NONATOMIC_IOSONLY, copy) NSString * lastName;
//@property (NS_NONATOMIC_IOSONLY, copy) NSString * email;
//@property (NS_NONATOMIC_IOSONLY, copy) NSString * phone;

-(id)initWithDictionary:(NSDictionary *)userDictionary;

-(id)initWithFirstName:(NSString *)firstName AndLast:(NSString *)lastName andEmail: (NSString *)email andPhone:(NSString *)phone;

-(NSDictionary *)toDictionary;


@end

NS_ASSUME_NONNULL_END
