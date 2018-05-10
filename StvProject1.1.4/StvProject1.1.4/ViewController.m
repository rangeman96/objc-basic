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
    
    //指定イニシャライザの場合は initに値を持たせてあるのでalloc initを使う
    //Account* account = [account alloc]; インスタンス化、メモリの確保
    //account = [account init]; 初期化
    //initWith 初期値を代入
    
    Account *person1 = [[Account alloc] initWithName:@"takeshi" age:30 sex:@"man" words:@"Swift"];
    Account *person2 = [[Account alloc] initWithName:@"yumiko" age:22 sex:@"woman" words:@"Java"];
    
    NSArray *array = @[person1, person2];//@[  ]がArrayの記法
    for (Account *team in array){//上の *array@[p1,p2] をteamに入れて高速列挙してる
        [team printAccount];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end;
