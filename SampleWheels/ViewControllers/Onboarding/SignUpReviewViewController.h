//
//  SignUpReviewViewController.h
//  SampleWheels
//
//  Created by Waleed Rahman on 3/15/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserProfile.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SignUpReviewVCDelegate <NSObject>

-(void)updateFirstNameTo:(NSString *)firstName forProfile:(UserProfile *)profile;
-(void)updateLastNameTo:(NSString *)lastName forProfile:(UserProfile *)profile;
-(void)updateEmailTo:(NSString *)email forProfile:(UserProfile *)profile;
-(void)updatePhoneNumberTo:(NSString *)phoneNumber forProfile:(UserProfile *)profile;
-(void)updateImageTo:(UIImage *)image forProfile:(UserProfile *)profile;

@end

@interface SignUpReviewViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) UserProfile* profile;
@property (nonatomic, weak) id<SignUpReviewVCDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
