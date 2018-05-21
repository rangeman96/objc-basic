//
//  ViewController.m
//  StvProject2.1.6-2
//
//  Created by 竹本大地 on 2018/05/15.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // デリゲート
    self.webView.delegate = self;
    
    // URLを指定
    //NSURL *url = [NSURL URLWithString:@"http://www.apple.com/iphone/"];
    NSURL *url = [NSURL URLWithString:@"http://www.asahi.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // リクエストを投げる
    [self.webView loadRequest:request];
}

    // ロード時にインジケータをまわす
- (void)webViewDidStartLoad:(UIWebView*)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

    // ロード完了で非表示
- (void)webViewDidFinishLoad:(UIWebView*)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

    //オフライン時の処理
- (void)createAleartController {
    NSString *alertTitle = [NSBundle.mainBundle localizedStringForKey:@"alertTitle" value:nil table:@"Localizable"];
    NSString *alertMessege = [NSBundle.mainBundle localizedStringForKey:@"alertMessege" value:nil table:@"Localizable"];
    NSString *alertActiontitle = [NSBundle.mainBundle localizedStringForKey:@"alertActiontitle" value:nil table:@"Localizable"];
    self.alertController = [UIAlertController alertControllerWithTitle:alertTitle message:alertMessege preferredStyle:UIAlertControllerStyleAlert];
    
    // アラートボタンとそのアクションを設定
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:alertActiontitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        NSLog(@"インターネットに接続されていません。");
    }];
    
    // アラートコントローラーにアラートをセット
    [self.alertController addAction:okButton];
    NSLog(@"アラートセット完了");
    
}
    // エラーの場合、エラーコードに応じてアラートを表示する
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"エラー");
    [self createAleartController];
    // オフラインによるエラー場合のみアラートを出す
    /*if (error.code == NSURLErrorNotConnectedToInternet) {
        [self presentViewController:self.tabBarController animated:YES completion:nil];
    }*/
    
}

@end
