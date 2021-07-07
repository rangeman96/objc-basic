//
//  ViewController.m
//  StvProject2.1.7
//
//  Created by 竹本大地 on 2018/05/23.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *editTextField;

@property (strong, nonatomic) UITapGestureRecognizer *singleTap;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.editTextField.returnKeyType = UIReturnKeyDone;
    self.editTextField.delegate = self;
    
    // 背景タップ時の処理
    self.singleTap = [[UITapGestureRecognizer alloc]
                      initWithTarget:self action:@selector(onSingleTap:)];
    self.singleTap.delegate = self;
    self.singleTap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:self.singleTap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 背景タップ時にキーボードを消す
- (void)onSingleTap:(UITapGestureRecognizer *)recognizer {
    [self.editTextField resignFirstResponder];
}

// キーボードが表示されていない時は無効化
- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (gestureRecognizer == self.singleTap) {
        //キーボード表示時のみ有効
        if (self.editTextField.isFirstResponder) {
            return YES;
        } else {
            return NO;
        }
    }
    return YES;
}

// 最大入力文字数の設定
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // 最大文字数設定
    int maxInputLength = 30;
    // 入力済みテキスト取得
    NSMutableString *str = [textField.text mutableCopy];
    // 入力済みテキストと入力が行われたテキストの結合
    [str replaceCharactersInRange:range withString:string];
    
    if ([str length] > maxInputLength) {
        // 最大文字数を超えた時の通知
        UIAlertController *overStrAlert =[UIAlertController
                                          alertControllerWithTitle:@"文字数オーバー"
                                          message:@"最大文字数は30文字です。"
                                          preferredStyle:UIAlertControllerStyleAlert];
        
        [overStrAlert addAction:[UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:nil]];
        
        [self presentViewController:overStrAlert animated:YES completion:nil];
        
        return NO;
    }
    return YES;
}
@end
