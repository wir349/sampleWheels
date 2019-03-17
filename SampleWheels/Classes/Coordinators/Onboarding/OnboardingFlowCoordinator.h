//
//  OnboardingFlowCoordinator.h
//  SampleWheels
//
//  Created by Waleed Rahman on 3/15/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coordinator.h"
#import "SignUpFormViewController.h"
#import "SignUpCameraViewController.h"
#import "SignUpReviewViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface OnboardingFlowCoordinator : Coordinator<SignUpFormVCDelegate>

@property (weak) UIWindow * window;
@property (weak) Coordinator *parentCoordinator;

@property NSArray *childCoordinators;


-(instancetype)initWithParent:(Coordinator *)coordinator andWindow: (UIWindow *)window;

-(void)start;

-(void)didFinishCoordinationForChild:(Coordinator *)coordinator;

@end

NS_ASSUME_NONNULL_END
