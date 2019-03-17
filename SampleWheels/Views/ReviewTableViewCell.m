//
//  ReviewTableViewCell.m
//  SampleWheels
//
//  Created by Waleed Rahman on 3/17/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import "ReviewTableViewCell.h"

@implementation ReviewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupWithTitle:(NSString *)title andFieldValue:(NSString *)fieldValue {
    self.titleLabel.text = title;
    self.textLabel.text = fieldValue;
    self.errorLabel.text = @"";
}

- (void)setErrorText:(NSString *)error {
    self.errorLabel.text = error;
}

@end
