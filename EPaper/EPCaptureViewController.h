//
//  EPCaptureViewController.h
//  EPaper
//
//  Created by user on 13-5-4.
//  Copyright (c) 2013年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPCaptureViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
//@property (nonatomic, retain) IBOutlet UIImageView *imageView;
//@property (nonatomic, retain) IBOutlet UIToolbar *myToolbar;

- (IBAction)photoLibraryAction:(id)sender;
- (IBAction)cameraAction:(id)sender;
@end
