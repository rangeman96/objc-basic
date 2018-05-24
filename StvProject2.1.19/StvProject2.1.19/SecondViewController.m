//
//  SecondViewController.m
//  StvProject2.1.19
//
//  Created by 竹本大地 on 2018/05/21.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
// プロパティを定義
@property (weak, nonatomic) IBOutlet UILabel *catchResultLabel;

@end

@implementation SecondViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // 受け取り用の変数をresultLabelに代入する
    self.catchResultLabel.text = self.receiveString;
}

    // 戻るボタン
    
- (IBAction)backButtom:(id)sender {
        [self dismissViewControllerAnimated:YES completion:nil];
}

@end
