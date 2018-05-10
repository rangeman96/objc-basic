//
//  ViewController.m
//  StvProject1.1.5
//
//  Created by 竹本大地 on 2018/05/08.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"
#import "Account.h"

@interface ViewController ()
@end

@implementation ViewController

   - (void)viewDidLoad {
      [super viewDidLoad];
       
        Account *account = [Account new]; //インスタンス化
        [account printAccount]; //Accountから呼ぶ
   }

   - (void)didReceiveMemoryWarning {
      [super didReceiveMemoryWarning];
   }


@end
