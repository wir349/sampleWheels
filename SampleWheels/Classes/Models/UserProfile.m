//
//  UserProfile.m
//  SampleWheels
//
//  Created by Waleed Rahman on 3/15/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import "UserProfile.h"

@interface UserProfile ()

+ (NSString *) createUserIdWithFirstName: (NSString *)firstName andLastName: (NSString *) lastName;

@end

@implementation UserProfile

-(id)initWithDictionary:(NSDictionary *)userDictionary {
    if((self = [super init])) {
        _firstName = userDictionary[FIRSTNAME];
        _lastName = userDictionary[LASTNAME];
        _email = userDictionary[EMAIL];
        _phoneNumber = userDictionary[PHONE];
        
        NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:userDictionary[PICTURE] options:0];
        _picture = [UIImage imageWithData:decodedData];
    }
    return self;
}

- (id)initWithFirstName:(NSString *)firstName AndLast:(NSString *)lastName andEmail:(NSString *)email andPhone:(NSString *)phone {
    if((self = [super init])) {
        _userId = [UserProfile createUserIdWithFirstName:firstName andLastName:lastName];
        _firstName = firstName;
        _lastName = lastName;
        _email = email;
        _phoneNumber = phone;
    }
    return self;
}

+ (NSString *)createUserIdWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName {
    NSArray *array = [[NSArray alloc] initWithObjects:[firstName lowercaseString], [lastName lowercaseString], nil];
    return [array componentsJoinedByString:@"-"];
}

//-(NSString *)description {
//    return [NSString stringWithFormat:@"%ld %@ %@ %@ %ld %ld %ld %ld %ld %@ %ld %@ %@", (long)self.userId, self.email, self.firstName, self.lastName, (long)self.passengerId, (long)self.accessType, (long)self.admin, (long)self.companyId, (long)self.accessTokenId, self.accessToken, (long)self.numberOfUserHelped, self.mobileNumber, self.invitationCode];
//}


//+(UserModel*) getSignedInUser
//{
////    UserModel * userModel = [[UserModel alloc]init];
////    NSUserDefaults  * userDefault = [NSUserDefaults standardUserDefaults];
////    userModel.userId = [userDefault integerForKey:USER_ID_KEY];
////    userModel.email = [userDefault objectForKey:USER_EMAIL_KEY];
////    userModel.mobileNumber = [userDefault objectForKey:MOBILE_NUMBER_KEY];
////    userModel.firstName =[userDefault objectForKey:USER_FIRST_NAME_KEY];
////    userModel.lastName = [userDefault objectForKey:USER_LAST_NAME_KEY];
////    userModel.passengerId = [userDefault integerForKey:PASSENGER_ID_KEY];
////    userModel.accessType = [userDefault integerForKey:ACCESS_TYPE_KEY];
////    userModel.admin = [userDefault integerForKey:ADMIN_KEY];
////    userModel.companyId = [userDefault integerForKey:COMPANY_ID_KEY];
////    userModel.accessTokenId = [userDefault integerForKey:USER_ACCESS_TOKEN_ID_KEY];
////    userModel.numberOfUserHelped = [userDefault integerForKey:NUMBER_OF_USER_HELPED_KEY];
////    userModel.accessToken = [userDefault objectForKey:ACCESS_TOKEN_KEY];
////    userModel.mobileNumber = [userDefault objectForKey:MOBILE_NUMBER_KEY];
////    userModel.invitationCode = [userDefault objectForKey:INVITATION_CODE_KEY];
//    NSLog(@"User Model: %@", userModel);
//    if (userModel.email) {
//        return userModel;
//    }
//    return nil;
//}

-(NSDictionary *)toDictionary {
    NSMutableDictionary* dict = [@{
             FIRSTNAME: self.firstName,
             LASTNAME: _lastName,
             EMAIL: _email,
             PHONE: _phoneNumber
             } mutableCopy];
    if (_picture != nil) {
        NSData *imageData = UIImagePNGRepresentation(_picture);
        NSString *imageString = [imageData base64EncodedStringWithOptions:0];
        dict[PICTURE] = imageString;
    }
    return dict;
}


@end
