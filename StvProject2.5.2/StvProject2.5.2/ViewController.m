//
//  ViewController.m
//  StvProject2.5.2
//
//  Created by 竹本大地 on 2018/05/31.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
//カメラを開く
- (IBAction)cameraButtonTouched:(id)sender {
    // カメラ利用
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    // カメラが利用できるか確認
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *imagePickerController = [UIImagePickerController new];
        // カメラかライブラリからの読込指定。カメラを指定。
        imagePickerController.sourceType = sourceType;
        // トリミングなどを行うか否か
        imagePickerController.allowsEditing = YES;
        // Delegate
        imagePickerController.delegate   = self;
        // アニメーションをしてカメラUIを起動
        [self presentViewController:imagePickerController animated:YES completion:nil];
    } else {
        NSLog(@"Camera invalid.");
    }
}

// 完了後
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    UIImage *saveImage;
    if(editedImage) {
        saveImage = editedImage;
    } else {
        saveImage = originalImage;
    }
    // UIImageViewに画像を設定
    self.photoView.image = saveImage;
    if(picker.sourceType == UIImagePickerControllerSourceTypeCamera){
        // カメラから呼ばれた場合は画像をフォトライブラリに保存してViewControllerを閉じる
        UIImageWriteToSavedPhotosAlbum(saveImage, nil, nil, nil);
        [self dismissViewControllerAnimated:YES completion:nil];
//    } else {
//        // フォトライブラリから呼ばれた場合はPopOverを閉じる（iPad）
//        [popover dismissPopoverAnimated:YES];
//        [popover release];
//        popover = nil;
//    }
//}
//}
//// Popupが閉じるときに呼ばれるDelegate
//-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
//    [popover release];
//    popover = nil;
}
}
// キャンセル時の処理
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// info.plistにNSCameraUsageDescriptionの記載が必須


@end
