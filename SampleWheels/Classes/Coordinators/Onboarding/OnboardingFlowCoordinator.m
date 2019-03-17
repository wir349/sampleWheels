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

-(UIStoryboard *)getOnboardStoryboard;

- (void)navigateToCameraVCWithProfile:(UserProfile *)profile;
-(void)navigateToReviewVCWithProfile:(UserProfile *)profile;

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
    formVC.delegate = self;
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

#pragma mark - Navigation

-(UIStoryboard *)getOnboardStoryboard {
    UIStoryboard *onboardingStoryboard = [UIStoryboard storyboardWithName:@"Onboarding" bundle:nil];
    return onboardingStoryboard;
}

- (void)navigateToCameraVCWithProfile:(UserProfile *)profile {
    SignUpCameraViewController *cameraVC = [[self getOnboardStoryboard] instantiateViewControllerWithIdentifier:@"camera"];
    cameraVC.delegate = self;
    cameraVC.profile = profile;
    [_navController pushViewController:cameraVC animated:true];
}

- (void)navigateToReviewVCWithProfile:(UserProfile *)profile {
    SignUpReviewViewController *reviewVC = [[self getOnboardStoryboard] instantiateViewControllerWithIdentifier:@"review"];
    reviewVC.delegate = self;
    reviewVC.profile = profile;
    [_navController pushViewController:reviewVC animated:true];
}

    //MARK: SignUpFormVCDelegate Methods

- (void)didSubmitFormWithProfile:(UserProfile *)profile {
        //Save Profile to FIRDatabase
    [self navigateToCameraVCWithProfile:profile];
}

    //MARK: SignUpCameraVCDelegate Methods

- (void)didTakePictureForProfile:(UserProfile *)profile {
        //Save Picture to FIRDatabase
    [self navigateToReviewVCWithProfile:profile];
}

    //MARK: SignUpReviewVCDelegate Methods

- (void)updateEmailTo:(nonnull NSString *)email forProfile:(nonnull UserProfile *)profile {
    //Save to DB
}

- (void)updateFirstNameTo:(nonnull NSString *)firstName forProfile:(nonnull UserProfile *)profile {
    //Save to DB
}

- (void)updateImageTo:(nonnull UIImage *)image forProfile:(nonnull UserProfile *)profile {
    //Save to DB
}

- (void)updateLastNameTo:(nonnull NSString *)lastName forProfile:(nonnull UserProfile *)profile {
    //Save to DB
}

- (void)updatePhoneNumberTo:(nonnull NSString *)phoneNumber forProfile:(nonnull UserProfile *)profile {
    //Save to DB
}

-(void)dealloc {
    NSLog(@"Dealloc");
}


@end
