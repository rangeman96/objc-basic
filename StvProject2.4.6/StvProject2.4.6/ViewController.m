//
//  ViewController.m
//  StvProject2.4.6
//
//  Created by 竹本大地 on 2018/05/29.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "ViewController.h"
#import <Photos/Photos.h>
#import <FBSDKShareKit/FBSDKSharePhoto.h>
#import <FBSDKShareKit/FBSDKSharePhotoContent.h>
#import <FBSDKShareKit/FBSDKShareDialog.h>
//#import <FBSDKCoreKit/FBSDKCoreKit.h>
//#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property FBSDKSharePhotoContent *content;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    FBSDKLoginButton *loginButton = [FBSDKLoginButton new];
//    loginButton.center = self.view.center;
//    [self.view addSubview:loginButton];
//
//    if ([FBSDKAccessToken currentAccessToken])
//    {
//        loginButton.readPermissions = @[@"public_profile", @"email"];
//    }
//    return;
}


- (IBAction)imgPickBtn:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        UIImagePickerController *imagePickerController = [UIImagePickerController new];
        // 起動した際に何を開くかの選択
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // 取得後編集するかどうか
        imagePickerController.allowsEditing = YES;
        imagePickerController.delegate = self;
        
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }
}

// 選択をすると自動的に呼ばれる
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    // まずはmodalを閉じないとhierarchy errorがでる
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // 選択したイメージを受け取る
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    FBSDKSharePhoto *photo = [FBSDKSharePhoto new];
    photo.image = image;
    photo.userGenerated = YES;
    self.content = [FBSDKSharePhotoContent new];
    self.content.photos = @[photo];
    
    [FBSDKShareDialog showFromViewController:self
                                 withContent:self.content
                                    delegate:nil];
}

// キャンセル押した時のメソッド
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
