//
//  AppCoordinator.h
//  SampleWheels
//
//  Created by Waleed Rahman on 3/16/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Coordinator.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppCoordinator : Coordinator

@property UIWindow * window;

@property NSArray *childCoordinators;

- (instancetype)initWithWindow: (UIWindow *)window;

-(void)start;

-(void)didFinishCoordinationForChild:(Coordinator *)coordinator;

@end

NS_ASSUME_NONNULL_END
