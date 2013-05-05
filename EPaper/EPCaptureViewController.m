//
//  EPCaptureViewController.m
//  EPaper
//
//  Created by user on 13-5-4.
//  Copyright (c) 2013年 user. All rights reserved.
//

#import "EPCaptureViewController.h"
#import "EPFlatButton.h"
@interface EPCaptureViewController ()

@end

@implementation EPCaptureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    EPFlatButton* btnCapture = [EPFlatButton buttonWithType:UIButtonTypeCustom];
    btnCapture.frame = CGRectMake(100, 90, 100, 30);
    btnCapture.backgroundColor = [UIColor lightGrayColor];
    btnCapture.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btnCapture.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btnCapture.radius = 8.0;
    btnCapture.margin = 4.0;
    btnCapture.depth = 3.0;
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)showImagePicker:(UIImagePickerControllerSourceType)sourceType
{
    //if (self.imageView.isAnimating){
        //[self.imageView stopAnimating];
    //}
    
    //if ([UIImagePickerController isSourceTypeAvailable:sourceType]){
        //[self.overlayViewController setupImagePicker:sourceType];
        //[self presentModalViewController:self.overlayViewController.imagePickerController animated:YES];
    //}
}

- (IBAction)photoLibraryAction:(id)sender
{
	//[self showImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (IBAction)cameraAction:(id)sender
{
    //[self showImagePicker:UIImagePickerControllerSourceTypeCamera];
}

@end
