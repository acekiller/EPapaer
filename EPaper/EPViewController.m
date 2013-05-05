//
//  EPViewController.m
//  EPaper
//
//  Created by user on 13-5-1.
//  Copyright (c) 2013年 user. All rights reserved.
//

#import "EPObject.h"
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
    self.array = [NSMutableArray arrayWithCapacity:1024];
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
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
 
    struct CGImage *inImage0 = [image CGImage];
    struct CGImage *inImage1 = [image CGImage];
    CGContextRef cgctx0 = [self CreateARGBBitmapContext:inImage0];
    CGContextRef cgctx1 = [self CreateARGBBitmapContext:inImage1];;

    size_t w = CGImageGetWidth(inImage0);
    size_t h = CGImageGetHeight(inImage0);
    CGRect rect = {{0,0},{w,h}};
    
    CGContextDrawImage(cgctx0, rect, inImage0);
    void *data0 = CGBitmapContextGetData (cgctx0);
    CGContextDrawImage(cgctx1, rect, inImage1);
    void *data1 = CGBitmapContextGetData (cgctx1);

    [self gray:data0 withWidth:w withHeight:h]; //Gray
    [self gray:data1 withWidth:w withHeight:h]; //Gray
    CGImageRef image_bw = CGBitmapContextCreateImage(cgctx0);
    [self saveRGB:image_bw];//save
    
    [self linearX:data0 withWidth:w withHeight:h]; //X
    CGImageRef image_lx = CGBitmapContextCreateImage(cgctx0);
    [self saveRGB:image_lx];
    [self range:data0 withWidth:w withHeight:h];
    
    [self linearY:data1 withWidth:w withHeight:h]; //Y
    CGImageRef image_ly = CGBitmapContextCreateImage(cgctx1);
    [self saveRGB:image_ly];
    
    CGContextRelease(cgctx0);
    free(data0);
    CGContextRelease(cgctx1);
    free(data1);
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
    
    context = CGBitmapContextCreate (bitmapData,
                                     pixelsWide,
                                     pixelsHigh,
                                     8,
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
            
            if(sum > MAGIC) {
                ptr->r = WHITE;
                ptr->g = WHITE;
                ptr->b = WHITE;
                //ptr->a = 0xff;
            } else {
                ptr->r = BLACK;
                ptr->g = BLACK;
                ptr->b = BLACK;
                //ptr->a = 0xff;
            }
            ptr++;
        }
    }
}

- (void)linearX:(PRGB32)head withWidth:(size_t)_width withHeight:(size_t)_height
{
    BOOL flag;
    PRGB32 begin;
    PRGB32 end;
    
    for(LONG i=0; i<_height; i++){
        begin = head + (i * _width);
        end = begin + _width -1;
        flag = FALSE;
        
        for(LONG j=0; j<_width; j++){
            if(begin->r == BLACK){
                flag = TRUE;
                break;
            }
            begin ++;
        }
        
        if(flag){
            for(int k=0; k<_width; k++){
                if(!end->r)
                    break;
                end --;
            }
        }
        
        if(end>begin){
            int xx = end - begin;
            for (int i=0; i<xx; i++) {
                begin->r = BLACK;
                begin->g = BLACK;
                begin->b = BLACK;
                begin ++;
            }
        }
    }
}

- (void)linearY:(PRGB32)head withWidth:(size_t)_width withHeight:(size_t)_height
{
    BOOL flag;
    int dist;
    PRGB32 begin;
    PRGB32 end;
    
    for(LONG len=0; len<[self.array count]; len++){
        
        for(LONG i=0; i<_width; i++){
            begin = (PRGB32)head + [[self.array objectAtIndex:len] val0]*_width + i;
            end = (PRGB32)head + [[self.array objectAtIndex:len] val1]*_width + i;
            flag = FALSE;
            
            for(LONG j=0; j<[[self.array objectAtIndex:len] val1]-[[self.array objectAtIndex:len] val0]; j++){
                if(begin->r == BLACK){
                    flag = TRUE;
                    break;
                }
                begin += _width;
            }
            
            if(flag){
                for(LONG k=0; k<_height; k++){
                    if(end->r == BLACK){
                        break;
                    }
                    end -= _width;
                }
            }
            
            dist = (end - begin)/_width;
            if(dist>0){
                for(LONG s=0; s<dist; s++){
                    begin->r = BLACK;
                    begin->g = BLACK;
                    begin->b = BLACK;
                    begin += _width;
                }
            }
        }
    }
}

- (void)andXY:(PRGB32)head withHead1:(PRGB32)head1 withWidth:(size_t)_width withHeight:(size_t)_height
{
    char *ptr0;
    char *ptr1;
    DWORD len;
    
    len = _width * _height * sizeof(RGB32);
    ptr0 = head;
    ptr1 = head1;
    
    for(DWORD i=0; i<len; i++){
        *ptr0 |= *ptr1;
        ptr0 ++;
        ptr1 ++;
    }
}

- (void) range:(PRGB32)head withWidth:(size_t)_width withHeight:(size_t)_height
{
    PRGB32 begin;
    BOOL lastlineisblack = FALSE;
    BOOL currlineisblack = TRUE;
    EPRange *pos = [EPRange alloc];
    pos.val0 = 0;
    pos.val1 = 0;
    LONG i;
    
    lastlineisblack = FALSE;
    for(i=0; i<_height; i++){
        begin = (PRGB32)head + (i * _width);
        
        currlineisblack = FALSE;
        for(LONG j=0; j<_width; j++){
            if(begin->r == BLACK){
                currlineisblack = TRUE;
            }
            begin ++;
        }
        
        if(!lastlineisblack && currlineisblack){
            pos.val0 = i;
        }else if(lastlineisblack && !currlineisblack){
            pos.val1 = i-1;
            [self.array addObject:pos];
            pos = [EPRange alloc];
        }
        
        if(currlineisblack)
            lastlineisblack = TRUE;
        else
            lastlineisblack = FALSE;
    }
    
    if(currlineisblack){
        pos.val1 = i;
        [self.array addObject:pos];
        pos = [EPRange alloc];
    }
}

@end
