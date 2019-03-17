//
//  ReviewTableViewCell.m
//  SampleWheels
//
//  Created by Waleed Rahman on 3/17/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import "ReviewTableViewCell.h"

@interface ReviewTableViewCell ()

@end

@implementation ReviewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupWithTitle:(NSString *)title {
    self.titleLabel.text = title;
    self.errorLabel.text = @"";
}

- (void)setErrorText:(NSString *)error {
    self.errorLabel.text = error;
}

-(BOOL)isEditing {
    if (_editButton.imageView.image == [UIImage imageNamed:@"pencil"]) {
        return false;
    }
    return true;
}

- (void)setAsEditing:(BOOL)editing withValue:(NSString *)value {
    if (editing) {
            //Set to editing mode
        [_editButton setImage:[UIImage imageNamed:@"checkmark"] forState:UIControlStateNormal];
        [_fieldValue setHidden:YES];
        [_textField setText:value];
        [_textField setHidden:NO];
    }
    else {
            //Set to normal mode
        [_editButton setImage:[UIImage imageNamed:@"pencil"] forState:UIControlStateNormal];
        [_textField setHidden:YES];
        [_fieldValue setText:value];
        [_fieldValue setHidden:NO];
    }
}



@end
