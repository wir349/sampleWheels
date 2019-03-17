//
//  OnboardingFlowCoordinator.m
//  SampleWheels
//
//  Created by Waleed Rahman on 3/15/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import "OnboardingFlowCoordinator.h"
#import "SignUpFormViewController.h"
#import "UserProfile.h"

@interface OnboardingFlowCoordinator ()

@property UINavigationController* navController;

@end

@implementation OnboardingFlowCoordinator

- (instancetype)initWithParent:(Coordinator *)coordinator andWindow:(UIWindow *)window {
    self = [super init];
    if (self) {
        self.parentCoordinator = coordinator;
        self.window = window;
        self.childCoordinators = [[NSArray alloc] init];
    }
    return self;
}

- (void)start {
    UIStoryboard *onboardingStoryboard = [UIStoryboard storyboardWithName:@"Onboarding" bundle:nil];
    SignUpFormViewController *formVC = [onboardingStoryboard instantiateViewControllerWithIdentifier:@"form"];
    //Set Self as Delegate
    self.navController = [[UINavigationController alloc] initWithRootViewController:formVC];
    [self.navController setNavigationBarHidden:true];
    
    [UIView transitionWithView:self.window duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.window.rootViewController = self.navController;
    } completion:^(BOOL finished) {
        [self.window makeKeyAndVisible];
    }];
}

- (void)didFinishCoordinationForChild:(Coordinator *)coordinator {
    //Do Nothing for now. Just for Coordinator Protocol implementation
}

- (void)didSubmitFormWithProfile:(UserProfile *)profile {
    //Save Profile to FIRDatabase
    //Create CameraVC Class
    //Set Self as Delegate
    //Give Profile object to Camera VC
    //Push CameraVC on Nav
}

- (void)didTakePicture:(UIImage *)pic {
    //Save Picture to FIRDatabase
    //Create CameraVC Class
    //Set Self as Delegate
    //Give Profile object to Review VC
    //Push ReviewVC on Nav
}

//- (void)changeEmailAddress:
//Add Methods for changing each field

@end
