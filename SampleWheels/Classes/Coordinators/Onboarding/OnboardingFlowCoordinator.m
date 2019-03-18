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
#import "RemoteProfileData.h"

@interface OnboardingFlowCoordinator ()

@property UINavigationController* navController;

@property (nonatomic) RemoteProfileData* remoteProfileService;
@property (nonatomic) UserProfile* userProfile;

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
        self.remoteProfileService = [[RemoteProfileData alloc] init];
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

    //TODO: Removed this profile
- (void)navigateToReviewVCWithProfile:(UserProfile *)profile {
    SignUpReviewViewController *reviewVC = [[self getOnboardStoryboard] instantiateViewControllerWithIdentifier:@"review"];
    reviewVC.delegate = self;
//    reviewVC.profile = profile;
    [_navController pushViewController:reviewVC animated:true];
    [self.remoteProfileService getProfileForUserId:profile.userId];
}

    //MARK: SignUpFormVCDelegate Methods

- (void)didSubmitFormWithProfile:(UserProfile *)profile {
    [self.remoteProfileService saveProfile:profile];
    _userProfile = profile;
    [self navigateToCameraVCWithProfile:profile];
}

    //MARK: SignUpCameraVCDelegate Methods

- (void)didTakePictureForProfile:(UserProfile *)profile {
    [self.remoteProfileService updateImage:profile.picture forUserId:profile.userId];
    _userProfile = profile;
    [self navigateToReviewVCWithProfile:profile];
}

    //MARK: SignUpReviewVCDelegate Methods

- (UserProfile *)savedProfile {
//    UserProfile *saved = [[UserProfile alloc] initWithFirstName:@"Waleed" AndLast:@"Rahman" andEmail:@"wir349@gmail.com" andPhone:@"1234567890"];
    //Should be retrieving this asynchronously
    return _userProfile;
}

- (void)updateEmailTo:(nonnull NSString *)email {
    //Save to DB
    [self.remoteProfileService updateEmail:email forUserId:_userProfile.userId];
    _userProfile.email = email; //Not really a good design decision. Saved profile should be retrieved from the db instead.
}

- (void)updateFirstNameTo:(nonnull NSString *)firstName {
    [self.remoteProfileService updateFirstName:firstName forUserId:_userProfile.userId];
    _userProfile.firstName = firstName; //Again, Not really a good design decision. Saved profile should be retrieved from the db instead.
}

- (void)updateImageTo:(nonnull UIImage *)image {
    [self.remoteProfileService updateImage:image forUserId:_userProfile.userId];
    _userProfile.picture = image;
}

- (void)updateLastNameTo:(nonnull NSString *)lastName {
    [self.remoteProfileService updateLastName:lastName forUserId:_userProfile.userId];
    _userProfile.lastName = lastName;
}

- (void)updatePhoneNumberTo:(nonnull NSString *)phoneNumber {
    [self.remoteProfileService updatePhoneNumber:phoneNumber forUserId:_userProfile.userId];
    _userProfile.phoneNumber = phoneNumber;
}

-(void)dealloc {
    NSLog(@"Dealloc");
}


@end
