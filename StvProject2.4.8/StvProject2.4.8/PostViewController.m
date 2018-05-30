//
//  PostViewController.m
//  StvProject2.4.8
//
//  Created by 竹本大地 on 2018/05/30.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "PostViewController.h"

@interface PostViewController ()

- (void)closeView;

@end

@implementation PostViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}


+ (BOOL)diveInstagram {
    NSURL *urlOfInstagram = [NSURL URLWithString:@"instagram://app"];
    //Instagramが開いたら
    if ([[UIApplication sharedApplication] canOpenURL:urlOfInstagram]) {
        return YES;
    }
        return NO;
}

- (void)openInstagram {
    //投稿する画像を作る
    //.igo型にする
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/image.igo"];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];

    //interactionController  直接フォーマット処理できないファイルをプレビュー、プリント
    self.interactionController = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
    //投稿先をInstagramだけに指定
    self.interactionController.UTI = @"com.instagram.exclusivegram";
    self.interactionController.delegate = self;

    BOOL present = [self.interactionController presentOpenInMenuFromRect:self.view.frame inView:self.view animated:YES];
    if (!present) {
        [self closeView];
    }
}

- (void)setImage:(UIImage *)image {
    //NSDataに変換
    //0.75fは画像のクオリティ
    NSData *imageData = UIImageJPEGRepresentation(image, 0.75f);
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/image.igo"];
    [imageData writeToFile:filePath atomically:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [self openInstagram];
}

- (void)documentInteractionController:(UIDocumentInteractionController *)controller
           didEndSendingToApplication:(NSString *)application{
    [self closeView];
}

- (void)closeView {
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    self.interactionController.delegate = nil;
}

#pragma mark - UIDocumentInteractionControllerDelegate
- (void)documentInteractionController:(UIDocumentInteractionController *)controller
        willBeginSendingToApplication:(NSString *)application{
}

- (void) documentInteractionControllerDidDismissOpenInMenu: (UIDocumentInteractionController *) controller {
    // キャンセルで閉じたとき
    [self closeView];
}

@end
