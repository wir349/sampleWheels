//
//  SignUpFormViewController.m
//  SampleWheels
//
//  Created by Waleed Rahman on 3/15/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import "SignUpFormViewController.h"
#import "Coordinator.h"

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
    self.lastNameErrorLabel.text = @"";
    self.emailErrorLabel.text = @"";
    self.phoneNumberErrorLabel.text = @"";
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
    BOOL firstNameValidation = [self validateFirstName];
    BOOL lastNameValidation = [self validateLastName];
    BOOL emailValidation = [self validateEmail];
    BOOL phoneValidation = [self validatePhoneNumber];
    return firstNameValidation && lastNameValidation && emailValidation && phoneValidation;
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

- (BOOL)validateLastName {
    if ([self isTextFieldEmpty:self.lastNameTextField]) {
        self.lastNameErrorLabel.text = @"Last Name cannot be empty";
        return false;
    }
    if ([self doesTextFieldContainNumbers:self.lastNameTextField]) {
        self.lastNameErrorLabel.text = @"Last Name cannot contain numbers";
        return false;
    }
    self.lastNameErrorLabel.text = @"";
    return true;
}

- (BOOL)validateEmail {
    if ([self isTextFieldEmpty:self.emailTextField]) {
        self.emailErrorLabel.text = @"Email Address cannot be empty";
        return false;
    }
    if (![self textFieldContainsValidEmail:self.emailTextField]) {
        self.emailErrorLabel.text = @"Email Address format incorrect";
        return false;
    }
    self.emailErrorLabel.text = @"";
    return true;
}

- (BOOL)validatePhoneNumber {
    if ([self isTextFieldEmpty:self.phoneNumberTextField]) {
        self.phoneNumberErrorLabel.text = @"Phone Number cannot be empty";
        return false;
    }
    if (![self doesTextFieldContainOnlyNumbers:self.phoneNumberTextField]) {
        self.phoneNumberErrorLabel.text = @"Phone Number must contain only numbers";
        return false;
    }
    if (![self textFieldContainsValidPhone:self.phoneNumberTextField]) {
        self.phoneNumberErrorLabel.text = @"Phone Number format incorrect";
        return false;
    }

    self.phoneNumberErrorLabel.text = @"";
    return true;
}

- (BOOL) isTextFieldEmpty:(UITextField *) textField {
    if (textField.text == (id)[NSNull null] || textField.text.length == 0 )
        return true;
    return false;
}

- (BOOL) textFieldContainsValidEmail:(UITextField *) textField {
        //Create a regex string
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" ;
    
        //Create predicate with format matching your regex string
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:
                              @"SELF MATCHES %@", stricterFilterString];
    
        //return true if email address is valid
    return [emailTest evaluateWithObject:textField.text];
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

- (BOOL) textFieldContainsValidPhone:(UITextField *) textField {
        //Create a regex string
    NSString *stricterFilterString = @"[0-9]{10}" ;
    
        //Create predicate with format matching your regex string
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:
                              @"SELF MATCHES %@", stricterFilterString];
    
        //return true if email address is valid
    return [phoneTest evaluateWithObject:textField.text];
}

- (IBAction)submitButtonPressed:(id)sender {
    if ([self validateAllFields]) {
        UserProfile *profile = [[UserProfile alloc]
                                initWithFirstName:self.firstNameTextField.text
                                AndLast:self.lastNameTextField.text
                                andEmail:self.emailTextField.text
                                andPhone:self.phoneNumberTextField.text];
        //Submit to coordinator to go to next screen
        [self.delegate didSubmitFormWithProfile:profile];
        //Add Error handling if a user already exists
    }
}


@end
