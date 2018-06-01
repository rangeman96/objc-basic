//
//  ViewController.m
//  StvProject2.5.4
//
//  Created by 竹本大地 on 2018/05/31.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *cameraView;
@property (weak, nonatomic) UIImage *cameraImage;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}

// カメラボタンアクション
- (IBAction)cameraButton:(id)sender {
    // カメラの利用
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    // カメラが利用可能かチェック(カメラ機能の選択肢があるのかを)
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *cameraPicker = [UIImagePickerController new];
        cameraPicker.sourceType = sourceType;
        cameraPicker.delegate   = self;
        //selfのviewに用意したimagepickercontrollerを反映する（載せる）
        [self presentViewController:cameraPicker animated:YES completion:nil];
    } else {
        NSLog(@"カメラ起動失敗");
    }
}

// アルバムボタンアクション
- (IBAction)albumButton:(id)sender {
    // アルバムの利用
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *cameraPicker = [[UIImagePickerController alloc] init];
        cameraPicker.sourceType = sourceType;
        cameraPicker.delegate = self;
        // ビューを開く
        [self presentViewController:cameraPicker animated:YES completion:nil];
        NSLog(@"アルバムを起動しました。");
    } else {
        NSLog(@"アルバム起動に失敗しました。");
    }
}

// 完了後
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    self.cameraImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:nil];
    // 写真をフォトアルバムへ書き込む
    UIImageWriteToSavedPhotosAlbum(self.cameraImage, self, @selector(savedPic:didFinishSavingWithError:contextInfo:), NULL);
}

- (void)savedPic:(UIImage *)image didFinishSavingWithError:(NSError *)error
     contextInfo:(void *)contextInfo{
    if (error == nil) {
        self.cameraView.image = self.cameraImage;
    } else {
        NSLog(@"写真の保存に失敗しました。");
    }
}
//キャンセル時の処理
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
