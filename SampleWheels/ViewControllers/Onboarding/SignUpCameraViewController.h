//
//  SignUpImageViewController.h
//  SampleWheels
//
//  Created by Waleed Rahman on 3/15/19.
//  Copyright © 2019 Waleed. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SignUpCameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)takePhoto:  (UIButton *)sender;
//- (IBAction)selectPhoto:(UIButton *)sender;

//Add Default Image
//Set default image
//On save, only send when photo is taken, attach to userProfile object
//Add permissions



@end

NS_ASSUME_NONNULL_END
