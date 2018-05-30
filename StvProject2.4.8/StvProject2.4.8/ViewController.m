//
//  ViewController.m
//  StvProject2.4.8
//
//  Created by 竹本大地 on 2018/05/30.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "ViewController.h"
#import "PostViewController.h"

@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIDocumentInteractionControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self imgPost];
}

- (void)imgPost {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *imagePickerController = [UIImagePickerController new];
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePickerController.allowsEditing = YES;
        imagePickerController.delegate = self;
        
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];

    // カメラロールから画像を取得したら、instagramのURL Schemeを起動する
    if ([PostViewController diveInstagram]) {
        PostViewController *instagramViewController = [PostViewController new];
        [instagramViewController setImage:image];
        [self.view addSubview:instagramViewController.view];
        [self addChildViewController:instagramViewController];

    } else {
        NSLog(@"We can't shear!");
    }
}

@end
