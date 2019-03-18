//
//  SignUpResultsViewController.m
//  SampleWheels
//
//  Created by Waleed Rahman on 3/15/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import "SignUpReviewViewController.h"
#import "ReviewTableViewCell.h"
#import "ProfilePicTableViewCell.h"

typedef enum {
    firstName = 0,
    lastName = 1,
    emailAddress = 2,
    phoneNumber = 3,
    profilePic = 4
} UserProfileField;

@interface SignUpReviewViewController ()

@property (nonatomic) NSMutableArray *editingStatus;

@end

@implementation SignUpReviewViewController

- (void)viewDidLoad {
    _editingStatus = [[NSMutableArray alloc] initWithObjects:@NO, @NO, @NO, @NO, @NO, nil];
    [super viewDidLoad];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 85;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserProfile *profile = [self.delegate savedProfile];
    if (indexPath.row != profilePic) {
        ReviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"default" forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[ReviewTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"default"];
        }
        BOOL editingStatus = ((NSNumber *)self.editingStatus[indexPath.row]).boolValue;
        switch (indexPath.row) {
            case firstName:
                [cell setupWithTitle:@"First Name:"];
                cell.textField.keyboardType = UIKeyboardTypeAlphabet;
                [cell setAsEditing:editingStatus withValue:profile.firstName];
                break;
            case lastName:
                [cell setupWithTitle:@"Last Name:"];
                cell.textField.keyboardType = UIKeyboardTypeAlphabet;
                [cell setAsEditing:editingStatus withValue:profile.lastName];
                break;
            case emailAddress:
                [cell setupWithTitle:@"Email Address:"];
                cell.textField.keyboardType = UIKeyboardTypeEmailAddress;
                [cell setAsEditing:editingStatus withValue:profile.email];
                break;
            case phoneNumber:
                [cell setupWithTitle:@"Phone Number:"];
                cell.textField.keyboardType = UIKeyboardTypeNumberPad;
                [cell setAsEditing:editingStatus withValue:profile.phoneNumber];
                break;
            default:
                break;
        }
        return cell;
    }
    else {
        ProfilePicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"picture" forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[ProfilePicTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"picture"];
        }
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            [cell.choosePhotoButton setHidden:YES];
        cell.image.image = profile.picture;
        return cell;
    }
}

- (IBAction)editButtonPressed:(id)sender {
    CGPoint hitpoint = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *hitIndex = [self.tableView indexPathForRowAtPoint:hitpoint];
    ReviewTableViewCell *cell = (ReviewTableViewCell *)[self.tableView cellForRowAtIndexPath:hitIndex];
    BOOL editingStatus = ((NSNumber *)self.editingStatus[hitIndex.row]).boolValue;
    if (editingStatus == YES) {
        switch (hitIndex.row) {
            case firstName:
                [self.delegate updateFirstNameTo:cell.textField.text];
                break;
            case lastName:
                [self.delegate updateLastNameTo:cell.textField.text];
                break;
            case emailAddress:
                [self.delegate updateEmailTo:cell.textField.text];
                break;
            case phoneNumber:
                [self.delegate updatePhoneNumberTo:cell.textField.text];
                break;
            default:
                break;
        }
        self.editingStatus[hitIndex.row] = @NO;
    }
    else {
        self.editingStatus[hitIndex.row] = @YES;
    }

    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:@[hitIndex] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}

- (IBAction)choosePhotoButtonPressed:(id)sender {
//    ProfilePicTableViewCell *cell = (ProfilePicTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    ProfilePicTableViewCell *cell = (ProfilePicTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];

    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    cell.image.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
