//
//  EPViewController.m
//  EPaper
//
//  Created by user on 13-5-1.
//  Copyright (c) 2013年 user. All rights reserved.
//

#import "EPViewController.h"
#import "EPFlatButton.h"
#import "EPCaptureViewController.h"

@interface EPViewController ()

@end

@implementation EPViewController
@synthesize imagePickerController;
@synthesize popoverController;

- (void)viewDidLoad
{
    int x0 = 0, y0 = 0;
    int width = 100;
    int height = 30;
    int offset = 10;
    
    [super viewDidLoad];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(x0, y0, width, height)];
    label.text = @"Welcome";
    y0 += height + offset;
    
    [[EPFlatButton appearance] setFaceColor:[UIColor colorWithWhite:0.75 alpha:1.0] forState:UIControlStateDisabled];
    [[EPFlatButton appearance] setSideColor:[UIColor colorWithWhite:0.55 alpha:1.0] forState:UIControlStateDisabled];
    
    EPFlatButton* btnCapture = [EPFlatButton buttonWithType:UIButtonTypeCustom];
    btnCapture.frame = CGRectMake(x0, y0, width, height);
    btnCapture.backgroundColor = [UIColor lightGrayColor];
    btnCapture.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btnCapture.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btnCapture.radius = 8.0;
    btnCapture.margin = 4.0;
    btnCapture.depth = 3.0;
    
    btnCapture.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [btnCapture setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnCapture setTitle:@"Capture" forState:UIControlStateNormal];
    [btnCapture  addTarget:self action:@selector(onCapture) forControlEvents:UIControlEventTouchDown];
    y0 += height + offset;
    
    EPFlatButton* btnBuilder = [EPFlatButton buttonWithType:UIButtonTypeCustom];
    btnBuilder.frame = CGRectMake(x0, y0, width, height);
    btnBuilder.backgroundColor = [UIColor lightGrayColor];
    btnBuilder.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btnBuilder.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btnBuilder.radius = 8.0;
    btnBuilder.margin = 4.0;
    btnBuilder.depth = 3.0;
    btnBuilder.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [btnBuilder setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnBuilder setTitle:@"Builder" forState:UIControlStateNormal];
    [btnBuilder  addTarget:self action:@selector(onBuild) forControlEvents:UIControlEventTouchDown];
    y0 += height + offset;
    
    EPFlatButton* btnViewer = [EPFlatButton buttonWithType:UIButtonTypeCustom];
    btnViewer.frame = CGRectMake(x0, y0, width, height);
    btnViewer.backgroundColor = [UIColor lightGrayColor];
    btnViewer.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btnViewer.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btnViewer.radius = 8.0;
    btnViewer.margin = 4.0;
    btnViewer.depth = 3.0;
    btnViewer.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [btnViewer setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnViewer setTitle:@"Viewer" forState:UIControlStateNormal];
    [btnViewer  addTarget:self action:@selector(onView) forControlEvents:UIControlEventTouchDown];
    y0 += height + offset;
    
    //imagePickerController = [[UIImagePickerController alloc] init];
    //imagePickerController.delegate = self;
    
    //--------------------------------------
    
    //--------------------------------------
    [self.view addSubview:label];
    [self.view addSubview:btnCapture];
    [self.view addSubview:btnBuilder];
    [self.view addSubview:btnViewer];
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

- (void)onCapture
{
    NSLog(@"onCapture\n");
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        
    }
}

- (void)onBuild
{
    
    //EPCaptureViewController* vc = [[EPCaptureViewController alloc] init];
    NSLog(@"onBuild\n");
    self.imagePickerController = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary]) {
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePickerController.delegate = self;
        [imagePickerController setAllowsEditing:NO];
        //imagePickerController.view = self.view;
        //UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:imagePickerController];
        //self.popoverController = popover;
        //[self.popoverController presentPopoverFromRect:CGRectMake(0, 0, 300, 300) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    } else {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Error accessing photo library!" delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [alert show];
    }
    [self presentModalViewController:imagePickerController animated:YES];
    //[self.popoverController dismissPopoverAnimated:YES];
}

- (void)onView
{
    NSLog(@"onView\n");
}

@end
