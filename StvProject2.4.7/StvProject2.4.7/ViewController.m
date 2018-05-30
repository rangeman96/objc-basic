//
//  ViewController.m
//  StvProject2.4.7
//
//  Created by 竹本大地 on 2018/05/30.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "ViewController.h"
#import <TwitterKit/TWTRKit.h>

@interface ViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tweetMain];
}

// Check Token
- (void)tweetMain {
    
    // Check twitter verification token
    if ([[Twitter sharedInstance].sessionStore hasLoggedInUsers]) { // Available verification token
        [self imageTweet];
        
    } else { // No verification token
        
        // Login for Twitter
        [[Twitter sharedInstance] logInWithCompletion:^(TWTRSession *session, NSError *error) {
            // Login OK
            if (session) {
                NSLog(@"Signed in as %@", [session userName]);
                [self imageTweet];
            // Login Cancel
            } else {
                NSLog(@"Error: %@", [error localizedDescription]);
            }
        }];
    }
}

// Use UIImagePickerController
- (void)imageTweet {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        UIImagePickerController *imagePickerController = [UIImagePickerController new];
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePickerController.allowsEditing = YES;
        imagePickerController.delegate = self;
        
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }
}

// Get image.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    // Edit Post Twitter data.
    TWTRComposer *composer = [TWTRComposer new];
    [composer setText:@"TEST"];
    [composer setImage:image];
    [composer setURL:[NSURL URLWithString:@"http://sneakerwars.jp"]];
    
    // Post Twitter View
    [composer showFromViewController:self completion:^(TWTRComposerResult result) {
        if (result == TWTRComposerResultCancelled) { // Cancel
            NSLog(@"Tweet composition cancelled");
        }
        else {
            NSLog(@"Sending Tweet!");
        }
    }];
}

@end
