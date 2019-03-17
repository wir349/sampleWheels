//
//  ReviewTableViewCell.h
//  SampleWheels
//
//  Created by Waleed Rahman on 3/17/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReviewTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *fieldValue;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

-(void)setupWithTitle:(NSString *)title;

-(void)setErrorText:(NSString *)error;

-(BOOL)isEditing;

- (void)setAsEditing:(BOOL)editing withValue:(NSString *)value;

@end

NS_ASSUME_NONNULL_END
