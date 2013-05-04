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
#import <AssetsLibrary/AssetsLibrary.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CGColorSpace.h>

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


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    CGSize size = {0};
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    size = [image size];
    //NSData *imageData = NULL;
    //imageData = UIImagePNGRepresentation(image);
    struct CGImage *inImage = [image CGImage];// initWithCGImage]:
    //struct CGImage *bitmap_bw = CGImageCreateCopy(bitmap);
    //size_t w = CGImageGetWidth(bitmap_bw);
    //size_t h = CGImageGetHeight(bitmap_bw);
    //NSLog(@"ow = %f, oh = %f\n", size.width, size.height);
    //NSLog(@"xw = %zd, xh = %zd, bpp = %zd \n", w, h, CGImageGetBitsPerPixel(bitmap_bw));
    
    CGContextRef cgctx = [self CreateARGBBitmapContext:inImage];
    if (cgctx == NULL)
    {
        return;
    }
    
    size_t w = CGImageGetWidth(inImage);
    size_t h = CGImageGetHeight(inImage);
    CGRect rect = {{0,0},{w,h}};
    
    CGContextDrawImage(cgctx, rect, inImage);
    void *data = CGBitmapContextGetData (cgctx);
    if (data != NULL){
        [self gray:data withWidth:w withHeight:h]; //Gray
    }
    
    CGImageRef image_bw = CGBitmapContextCreateImage(cgctx);
    [self saveRGB:image_bw];
    
    CGContextRelease(cgctx);
    if (data){
        free(data);
    }
}

- (CGContextRef)CreateARGBBitmapContext:(struct CGImage *)inImage
{
    CGContextRef    context = NULL;
    CGColorSpaceRef colorSpace;
    void *          bitmapData;
    int             bitmapByteCount;
    int             bitmapBytesPerRow;
    
    // Get image width, height. We'll use the entire image.
    size_t pixelsWide = CGImageGetWidth(inImage);
    size_t pixelsHigh = CGImageGetHeight(inImage);
    
    // Declare the number of bytes per row. Each pixel in the bitmap in this
    // example is represented by 4 bytes; 8 bits each of red, green, blue, and
    // alpha.
    bitmapBytesPerRow   = (pixelsWide * 4);
    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
    
    // Use the generic RGB color space.
    //colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
    colorSpace = CGColorSpaceCreateDeviceRGB();
    if (colorSpace == NULL)
    {
        fprintf(stderr, "Error allocating color space\n");
        return NULL;
    }
    
    // Allocate memory for image data. This is the destination in memory
    // where any drawing to the bitmap context will be rendered.
    bitmapData = malloc( bitmapByteCount );
    if (bitmapData == NULL)
    {
        fprintf (stderr, "Memory not allocated!");
        CGColorSpaceRelease( colorSpace );
        return NULL;
    }
    
    // Create the bitmap context. We want pre-multiplied ARGB, 8-bits
    // per component. Regardless of what the source image format is
    // (CMYK, Grayscale, and so on) it will be converted over to the format
    // specified here by CGBitmapContextCreate.
    context = CGBitmapContextCreate (bitmapData,
                                     pixelsWide,
                                     pixelsHigh,
                                     8,      // bits per component
                                     bitmapBytesPerRow,
                                     colorSpace,
                                     kCGImageAlphaPremultipliedFirst);
    if (context == NULL)
    {
        free (bitmapData);
        fprintf (stderr, "Context not created!");
    }
    
    // Make sure and release colorspace before returning
    CGColorSpaceRelease( colorSpace );
    
    return context;
}


- (void)saveRGB:(CGImageRef)image
{
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library writeImageToSavedPhotosAlbum:image
                              orientation:UIImageOrientationUp
                          completionBlock:^(NSURL *assetURL, NSError *error){
                              if (error) {
                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error Saving"
                                                                                  message:[error localizedDescription]
                                                                                 delegate:nil
                                                                        cancelButtonTitle:@"Ok"
                                                                        otherButtonTitles: nil];
                                  [alert show];
                              }
                          }];
}

- (void)gray:(char*)head withWidth:(size_t)_width withHeight:(size_t)_height
{
    tracepoint();
    int sum;
    PRGB32  ptr;
    
    ptr = (PRGB32)head;
    for(int i=0; i<_width; i++) {
        for(int j=0; j<_height; j++) {
            sum = 0;
            sum += ptr->r;
            sum += ptr->g;
            sum += ptr->b;
            //sum += ptr->a;
            
            if(sum > 350) {
                ptr->r = 0xff;
                ptr->g = 0xff;
                ptr->b = 0xff;
                //ptr->a = 0xff;
            } else {
                ptr->r = 0;
                ptr->g = 0;
                ptr->b = 0;
                //ptr->a = 0xff;
            }
            ptr++;
        }
    }
}

@end
