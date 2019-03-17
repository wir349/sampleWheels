    //
    //  SignUpFormViewController.m
    //  SampleWheels
    //
    //  Created by Waleed Rahman on 3/15/19.
    //  Copyright © 2019 Waleed. All rights reserved.
    //

#import "SignUpFormViewController.h"
#import "Coordinator.h"
#import "ValidationHelper.h"

@interface NSString (StripWhiteSpace)

- (NSString *) removeAllWhitespace;

@end

@implementation NSString (StripWhiteSpace)

- (NSString *) removeAllWhitespace
{
    return [self stringByReplacingOccurrencesOfString:@"\\s" withString:@""
                                              options:NSRegularExpressionSearch
                                                range:NSMakeRange(0, [self length])];
}

@end

@interface SignUpFormViewController ()

- (BOOL) validateAllFields;
- (BOOL) validateFirstName;
- (BOOL) validateLastName;
- (BOOL) validateEmail;
- (BOOL) validatePhoneNumber;

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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
        //[[self.view viewWithTag:textField.tag+1] becomeFirstResponder];
    
    UIView *view = [self.view viewWithTag:textField.tag + 1];
    if (!view)
        [self submitButtonPressed: self];
    else
        [view becomeFirstResponder];
    return YES;
}

- (void)clearErrorLabels {
        //I know there's a discussion around using instance variables vs. public properties. I used to have a strong opinion on it but I've forgotten the details. Maybe I'll revisit it in the future.
    self.firstNameErrorLabel.text = @"";
    self.lastNameErrorLabel.text = @"";
    self.emailErrorLabel.text = @"";
    self.phoneNumberErrorLabel.text = @"";
}

- (BOOL) validateAllFields {
    BOOL firstNameValidation = [self validateFirstName];
    BOOL lastNameValidation = [self validateLastName];
    BOOL emailValidation = [self validateEmail];
    BOOL phoneValidation = [self validatePhoneNumber];
    return firstNameValidation && lastNameValidation && emailValidation && phoneValidation;
}

- (BOOL)validateFirstName {
    NSString *text = [self.firstNameTextField.text removeAllWhitespace];
    if ([ValidationHelper isTextEmpty:text]) {
        self.firstNameErrorLabel.text = @"First Name cannot be empty";
        return false;
    }
    if ([ValidationHelper doesTextContainNumbers:text]) {
        self.firstNameErrorLabel.text = @"First Name cannot contain numbers";
        return false;
    }
    self.firstNameErrorLabel.text = @"";
    return true;
}

- (BOOL)validateLastName {
    NSString *text = [self.lastNameTextField.text removeAllWhitespace];
    if ([ValidationHelper isTextEmpty:text]) {
        self.lastNameErrorLabel.text = @"Last Name cannot be empty";
        return false;
    }
    if ([ValidationHelper doesTextContainNumbers:text]) {
        self.lastNameErrorLabel.text = @"Last Name cannot contain numbers";
        return false;
    }
    self.lastNameErrorLabel.text = @"";
    return true;
}

- (BOOL)validateEmail {
    NSString *text = [self.emailTextField.text removeAllWhitespace];
    if ([ValidationHelper isTextEmpty:text]) {
        self.emailErrorLabel.text = @"Email Address cannot be empty";
        return false;
    }
    if (![ValidationHelper textContainsValidEmail:text]) {
        self.emailErrorLabel.text = @"Email Address format incorrect";
        return false;
    }
    self.emailErrorLabel.text = @"";
    return true;
}

- (BOOL)validatePhoneNumber {
    NSString *text = [self.phoneNumberTextField.text removeAllWhitespace];
    if ([ValidationHelper isTextEmpty:text]) {
        self.phoneNumberErrorLabel.text = @"Phone Number cannot be empty";
        return false;
    }
    if (![ValidationHelper doesTextContainOnlyNumbers:text]) {
        self.phoneNumberErrorLabel.text = @"Phone Number must contain only numbers";
        return false;
    }
    if (![ValidationHelper textContainsValidPhone:text]) {
        self.phoneNumberErrorLabel.text = @"Phone Number should have exactly 10 numbers";
        return false;
    }
    
    self.phoneNumberErrorLabel.text = @"";
    return true;
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

    //Declare a delegate, assign your textField to the delegate and then include these methods

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField.tag == 2 || textField.tag == 3)
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (textField.tag == 2 || textField.tag == 3)
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [self.view endEditing:YES];
    return YES;
}


- (void)keyboardDidShow:(NSNotification *)notification
{
    //Should probably animate this
    CGSize keyBoardSize = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    if (self.view.frame.origin.y == 0) {
        
        CGRect newFrame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y - keyBoardSize.height, self.view.frame.size.width, self.view.frame.size.height);
        self.view.frame = newFrame;
//        self.view.frame.origin.y -= keyboardSize.height;
    }
}

-(void)keyboardDidHide:(NSNotification *)notification {
    //Should probably animate this
        //The offset should actually be dynamically defined by the height property in the userInfo dictionary in the notification object. For now, this is a rudimentary implementation.
    [self.view setFrame:CGRectMake(0,0,320,460)];
}
@end
