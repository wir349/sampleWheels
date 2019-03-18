//
//  RemoteProfileData.m
//  SampleWheels
//
//  Created by Waleed Rahman on 3/16/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import "RemoteProfileData.h"
@import Firebase;

@interface RemoteProfileData ()

@property (strong, nonatomic) FIRDatabaseReference *usersRef;

@end

@implementation RemoteProfileData

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.usersRef = [[[[FIRDatabase database] reference] child:@"onboarding"] child:@"applicants"];
        //This line just for testing
        [self.usersRef observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
            NSLog(@"Got Snapshot: %@", snapshot);
        } withCancelBlock:^(NSError * _Nonnull error) {
            NSLog(@"%@", error.localizedDescription);
        }];
    }
    return self;
}

- (void)saveProfile:(UserProfile *)profile {
    [[self.usersRef child:profile.userId] setValue: [profile toDictionary]];
}

- (void)updateFirstName:(NSString *)firstName forUserId:(NSString *)userId {
    [[[self.usersRef child:userId] child:FIRSTNAME] setValue:firstName];
}

- (void)updateLastName:(NSString *)lastName forUserId:(NSString *)userId {
    [[[self.usersRef child:userId] child:LASTNAME] setValue:lastName];
}

- (void)updateEmail:(NSString *)email forUserId:(NSString *)userId {
    [[[self.usersRef child:userId] child:EMAIL] setValue:email];
}

- (void)updatePhoneNumber:(NSString *)number forUserId:(NSString *)userId {
    [[[self.usersRef child:userId] child:PHONE] setValue:number];
}

- (void)updateImage:(UIImage *)image forUserId:(NSString *)userId {
        //TODO: This one is required?
}

//This should be updated later to handle asynchronicity
- (UserProfile *)getProfileForUserId:(NSString *)userId {
    [[self.usersRef child:userId] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSLog(@"Got Snapshot: %@", snapshot);
            // Get user value
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    return nil;
}

@end
