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

-(void)setupWithTitle:(NSString *)title andFieldValue:(NSString *)fieldValue;

-(void)setErrorText:(NSString *)error;

@end

NS_ASSUME_NONNULL_END
