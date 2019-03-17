//
//  SignUpImageViewController.h
//  SampleWheels
//
//  Created by Waleed Rahman on 3/15/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserProfile.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SignUpCameraVCDelegate <NSObject>

- (void)didTakePictureForProfile:(UserProfile *)profile;

@end

@interface SignUpCameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) id<SignUpCameraVCDelegate> delegate;

@property (copy, nonatomic) UserProfile *profile;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)takePhoto:  (UIButton *)sender;
//- (IBAction)selectPhoto:(UIButton *)sender;

//Add Default Image
//Set default image
//On save, only send when photo is taken, attach to userProfile object
//Add permissions

- (IBAction)savePhoto:(id)sender;


@end

NS_ASSUME_NONNULL_END
