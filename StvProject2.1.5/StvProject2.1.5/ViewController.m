//
//  ViewController.m
//  StvProject2.1.5
//
//  Created by 竹本大地 on 2018/05/14.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)actionSheetBtnEnter:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"SNS" message:@"Choose" preferredStyle:UIAlertControllerStyleActionSheet];
    
    // 上から順にボタンが配置
    [alertController addAction:[UIAlertAction actionWithTitle:@"FaceBook" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
       // [self selectedActionWith:0];
        NSLog(@"FaceBook");
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Twitter" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
       // [self selectedActionWith:1];
        NSLog(@"Twitter");
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"LINE" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
       // [self selectedActionWith:2];
        NSLog(@"LINE");
    }]];

    [self presentViewController:alertController animated:YES completion:nil];
}

//-(void)selectedActionWith:(int)index{
//NSLog(@"選択: %d",index);
    // 選択時の処理
//}
@end
