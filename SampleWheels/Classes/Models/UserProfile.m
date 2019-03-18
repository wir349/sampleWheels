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
