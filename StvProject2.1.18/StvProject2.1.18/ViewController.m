//
//  ViewController.m
//  StvProject2.1.18
//
//  Created by 竹本大地 on 2018/05/21.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)goToB:(id)sender {
    // 遷移先のストーリーボードをインスタンス化
    UIStoryboard *secondStoryBoard = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
    // 遷移先のViewControllerをインスタンス化
    SecondViewController *secondViewController = [secondStoryBoard instantiateInitialViewController];
    // 遷移を実行
    [self.navigationController pushViewController:secondViewController animated:YES];
}

@end
