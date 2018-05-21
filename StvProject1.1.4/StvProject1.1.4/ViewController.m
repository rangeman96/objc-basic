//
//  ViewController.m
//  StvProject1.1.4
//
//  Created by 竹本大地 on 2018/05/02.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"
#import "Account.h"

@interface ViewController()

@end



@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Account* account = [account alloc]; インスタンス化、メモリの確保
    //account = [account init]; 初期化
    //initWith 初期値を代入
    Account *person1 = [ [ Account alloc ] initWithName: @"takeshi" age: 30 sex: @"man" words: @"Swift" ];
    Account *person2 =[ [ Account alloc ] initWithName: @"yumiko" age: 22 sex: @"woman" words: @"Java" ];
    
    NSArray *srt = {person1,person2};
    NSLog(@"%@", srt);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end;
