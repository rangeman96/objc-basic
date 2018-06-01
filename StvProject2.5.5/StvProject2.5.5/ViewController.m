//
//  ViewController.m
//  StvProject2.5.5
//
//  Created by 竹本大地 on 2018/06/01.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *cameraView;
@property (weak, nonatomic) IBOutlet UIButton *filterOnButton;
@property (weak, nonatomic) IBOutlet UIButton *filterOffButton;
@property (weak, nonatomic) UIImage *cameraImage;
@property (strong, nonatomic) UIImage *saveImage;

@end

static NSString *const FilterName = @"CIMinimumComponent";
static NSString *const FilterSetKey = @"inputImage";

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
// フィルターをかける処理（モノクロ）
- (void)addFilterAction {
    // 加工前の画像を保存（戻す時のため）
    self.saveImage = [UIImage new];
    self.saveImage = self.cameraView.image;
    // 元画像を取得
    UIImage *originImage = self.cameraView.image;
    // UIImageをCIImageに変換
    CIImage *filteredImage = [[CIImage alloc] initWithCGImage:originImage.CGImage];
    // CIFilterを作成（今回はモノクロフィルタ）
    CIFilter *filter = [CIFilter filterWithName:FilterName];
    [filter setValue:filteredImage forKey:FilterSetKey];
    // フィルタ後の画像を取得
    filteredImage = filter.outputImage;
    // CIContext,CGImageRefでフィルターを用意
    CIContext *ciContext = [CIContext contextWithOptions:nil];
    CGImageRef imageRef = [ciContext createCGImage:filteredImage fromRect:filteredImage.extent];
    // CIImageをUIImageに変換（フィルターの適用）
    UIImage *outputImage  = [UIImage imageWithCGImage:imageRef scale:2.5f orientation:UIImageOrientationUp];
    // 使用後のフィルターを破棄
    CGImageRelease(imageRef);
    // イメージを表示
    self.cameraView.image = outputImage;
    // ボタンの状態を変更
    self.filterOnButton.enabled = YES;
    self.filterOffButton.enabled = NO;
}

// フィルターをかけるメソッド
- (IBAction)photoShop:(id)sender {
    [self addFilterAction];
    
}

// 加工前に戻す
- (IBAction)backToTheOriginal:(id)sender {
    
    // 加工前の画像を反映
    self.cameraView.image = self.saveImage;
    
    // ボタンの状態を変更
    self.filterOnButton.enabled = NO;
    self.filterOffButton.enabled = YES;
}


@end
