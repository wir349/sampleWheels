//
//  SignUpFormViewController.h
//  SampleWheels
//
//  Created by Waleed Rahman on 3/15/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SignUpFormViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *firstNameErrorLabel;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *lastNameErrorLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailTextField;
@property (weak, nonatomic) IBOutlet UILabel *emailErrorLabel;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberErrorLabel;

@property (weak, nonatomic) IBOutlet UIButton *submitButton;

- (IBAction)submitButtonPressed:(id)sender;

@end

NS_ASSUME_NONNULL_END
