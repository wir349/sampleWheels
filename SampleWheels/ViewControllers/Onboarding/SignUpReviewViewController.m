//
//  SignUpResultsViewController.m
//  SampleWheels
//
//  Created by Waleed Rahman on 3/15/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import "SignUpReviewViewController.h"
#import "ReviewTableViewCell.h"

@interface SignUpReviewViewController ()

@end

@implementation SignUpReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != 4) {
        ReviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"default" forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[ReviewTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"default"];
        }
        switch (indexPath.row) {
            case 0:
                [cell setupWithTitle:@"First Name:" andFieldValue:self.profile.firstName];
                cell.textField.keyboardType = UIKeyboardTypeAlphabet;
                break;
            case 1:
                [cell setupWithTitle:@"Last Name:" andFieldValue:self.profile.lastName];
                cell.textField.keyboardType = UIKeyboardTypeAlphabet;
                break;
            case 2:
                [cell setupWithTitle:@"Email Address:" andFieldValue:self.profile.email];
                cell.textField.keyboardType = UIKeyboardTypeEmailAddress;
                break;
            case 3:
                [cell setupWithTitle:@"Phone Number:" andFieldValue:self.profile.phoneNumber];
                cell.textField.keyboardType = UIKeyboardTypeNumberPad;
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
