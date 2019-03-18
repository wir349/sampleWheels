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

-(UserProfile *)savedProfile;

-(void)updateFirstNameTo:(NSString *)firstName;
-(void)updateLastNameTo:(NSString *)lastName;
-(void)updateEmailTo:(NSString *)email;
-(void)updatePhoneNumberTo:(NSString *)phoneNumber;
-(void)updateImageTo:(UIImage *)image;

@end

@interface SignUpReviewViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

//@property (nonatomic) UserProfile* profile;
@property (nonatomic, weak) id<SignUpReviewVCDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)editButtonPressed:(id)sender;

@end

NS_ASSUME_NONNULL_END
