//
//  SignUpResultsViewController.m
//  SampleWheels
//
//  Created by Waleed Rahman on 3/15/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import "SignUpReviewViewController.h"
#import "ReviewTableViewCell.h"

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
    return 4;
}

    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != profilePic) {
        ReviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"default" forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[ReviewTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"default"];
        }
        UserProfile *profile = [self.delegate savedProfile];
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
        return nil;
    }
}

- (IBAction)editButtonPressed:(id)sender {
    CGPoint hitpoint = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *hitIndex = [self.tableView indexPathForRowAtPoint:hitpoint];
//    ReviewTableViewCell *cell = (ReviewTableViewCell *)[self.tableView cellForRowAtIndexPath:hitIndex];
    BOOL editingStatus = ((NSNumber *)self.editingStatus[hitIndex.row]).boolValue;
    if (editingStatus == YES) {
        self.editingStatus[hitIndex.row] = @NO;
    }
    else {
        self.editingStatus[hitIndex.row] = @YES;
    }

    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:@[hitIndex] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}
@end
