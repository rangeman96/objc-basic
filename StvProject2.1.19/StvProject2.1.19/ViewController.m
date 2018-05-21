//
//  ViewController.m
//  StvProject2.1.19
//
//  Created by 竹本大地 on 2018/05/21.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidDisappear:(BOOL)animated {
    // 受け渡し後、値をクリアにする
    self.myTextField.text = [NSString new];
}

// リターンキーでテキストを送信する
// 同時にキーボードを閉じる
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self sendButton:nil]; return [textField resignFirstResponder];
}

// TextField以外をタップでキーボードを閉じる
- (IBAction)closeKeyBoard:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)sendButton:(id)sender {
    //Second.storyboardの読み込み
    UIStoryboard *secondStoryboard = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
    
    // 遷移先クラスをインスタンス化して呼び出す
    SecondViewController *secondViewController = [secondStoryboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    secondViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    // 未入力の場合、代わりのメッセージを代入する
    if (self.myTextField.text.length == 0) {
        //textFieldが空の時
        self.myTextField.text = @"文字が入力されていません。";
    }
    
    // TextField内のテキストを、受け渡し用の変数にセットする
    secondViewController.receiveString = self.myTextField.text;
    // 画面遷移を行うメソッド
    [self presentViewController: secondViewController animated:YES completion: nil];
    
}
@end
