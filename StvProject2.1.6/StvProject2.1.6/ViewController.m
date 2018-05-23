//
//  ViewController.m
//  StvProject2.1.6
//
//  Created by 竹本大地 on 2018/05/23.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView1;

@end

@implementation ViewController

// Webロード時にインジケータを回す
- (void)webViewStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
// インジケータストップ
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

// オフライン時の処理
- (void)offlineAlert {
    UIAlertController *nosignalAlert = [UIAlertController
                                        alertControllerWithTitle:@"オフライン"
                                        message:@"ネットワークはオフラインです。"
                                        preferredStyle:UIAlertControllerStyleAlert];
    
    [nosignalAlert addAction:[UIAlertAction
                              actionWithTitle:@"OK"
                              style:UIAlertActionStyleDefault
                              handler:nil]];
    [self presentViewController:nosignalAlert animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // デリゲートの設定
    self.webView1.delegate = self;
}

// 画面アニメーション終了後の処理の記述
// DidLoadやとヒエラルキーエラーがでる
- (void)viewDidAppear:(BOOL)animated {
    // URLの指定
    NSURL *url = [NSURL URLWithString:@"http://www.apple.com/jp"];
    NSURLRequest *urlReq = [NSURLRequest requestWithURL:url];
    [self.webView1 loadRequest:urlReq];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    // オフライン時の処理
    [self offlineAlert];
}

@end
