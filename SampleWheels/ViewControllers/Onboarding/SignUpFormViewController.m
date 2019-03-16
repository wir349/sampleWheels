//
//  SignUpFormViewController.m
//  SampleWheels
//
//  Created by Waleed Rahman on 3/15/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import "SignUpFormViewController.h"
#import "UserProfile.h"

@interface SignUpFormViewController ()

//This could possibly be moved to a separate layer
- (BOOL) validateAllFields;
- (BOOL) validateFirstName;
- (BOOL) validateLastName;
- (BOOL) validateEmail;
- (BOOL) validatePhoneNumber;



- (BOOL) isTextFieldEmpty:(UITextField *) textField;
- (BOOL) doesTextFieldContainNumbers:(UITextField *) textField;
- (BOOL) doesTextFieldContainOnlyNumbers:(UITextField *) textField;

@end

@implementation SignUpFormViewController

    //When keyboard pops up, screen should move up.
    //Next goes to the next box.
    //Phone number box's next goes to the next page
    //Validate each box, show small red etex
    //First name validation - No numbers
    //Last name validation - No numbers
    //Email name validation - Email Regex
    //Phone Number Validation - should autoformat
    //Can't go to next screen until all fields are filled out properly
    //Fields go to coordinator, which creates UserProfile object.



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self clearErrorLabels];
}

- (void)clearErrorLabels {
    //I know there's a discussion around using instance variables vs. public properties. I used to have a strong opinion on it but I've forgotten the details. Maybe I'll revisit it in the future.
    self.firstNameErrorLabel.text = @"";
    self.lastNameTextField.text = @"";
    self.emailTextField.text = @"";
    self.phoneNumberTextField.text = @"";
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL) validateAllFields {
    return [self validateFirstName] && [self validateLastName] && [self validateEmail] && [self validatePhoneNumber];
}

- (BOOL)validateFirstName {
    if ([self isTextFieldEmpty:self.firstNameTextField]) {
        self.firstNameErrorLabel.text = @"First Name cannot be empty";
        return false;
    }
    if ([self doesTextFieldContainNumbers:self.firstNameTextField]) {
        self.firstNameErrorLabel.text = @"First Name cannot contain numbers";
        return false;
    }
    self.firstNameErrorLabel.text = @"";
    return true;
}

- (BOOL) isTextFieldEmpty:(UITextField *) textField {
    if (textField.text == (id)[NSNull null] || textField.text.length == 0 )
        return false;
    return true;
}

- (BOOL) doesTextFieldContainNumbers:(UITextField *) textField {
    NSCharacterSet* digits = [NSCharacterSet decimalDigitCharacterSet];
    if ([textField.text rangeOfCharacterFromSet:digits].location == NSNotFound)
        return false;
    return true;
}

- (BOOL) doesTextFieldContainOnlyNumbers:(UITextField *) textField {
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([textField.text rangeOfCharacterFromSet:notDigits].location == NSNotFound)
        return true;
    return false;
}

- (IBAction)submitButtonPressed:(id)sender {
    if ([self validateAllFields]) {
        //Create UserProfile Model
        //Submit to coordinator to go to next screen
    }
//    NSString *firstName = f
//    NSString *userId = self createUserIdWithFirstName:<#(NSString *)#> andLastName:<#(NSString *)#>
//    UserProfile *profile = [[UserProfile alloc] init];
    
}


@end
