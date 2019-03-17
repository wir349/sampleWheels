//
//  AppCoordinator.m
//  SampleWheels
//
//  Created by Waleed Rahman on 3/16/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import "AppCoordinator.h"
#import "Onboarding/OnboardingFlowCoordinator.h"

@interface AppCoordinator ()

- (void)displayOnboarding;
- (void)displayHome;

@end

@implementation AppCoordinator

- (instancetype)initWithWindow: (UIWindow *)window
{
    self = [super init];
    if (self) {
        self.window = window;
    }
    return self;
}

- (void)start {
    Boolean isUserAuthenticated = FALSE;
    if (isUserAuthenticated) {
        [self displayHome];
    }
    else {
        [self displayOnboarding];
    }
}

-(void)displayOnboarding {
    OnboardingFlowCoordinator *onboarding = [[OnboardingFlowCoordinator alloc] initWithParent:self andWindow:self.window];
    [onboarding start];
}

- (void)displayHome {
    //Nothing for now. This is just for the basic construction of the application.
}

- (void)didFinishCoordinationForChild:(Coordinator *)coordinator {
    //Do Nothing for now. Just for Coordinator Protocol implementation
}

@end
