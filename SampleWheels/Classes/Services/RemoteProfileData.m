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

@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

@implementation RemoteProfileData

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.ref = [[FIRDatabase database] reference];
    }
    return self;
}


@end
