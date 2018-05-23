//
//  ViewController.m
//  StvProject1.1.5-F
//
//  Created by 竹本大地 on 2018/05/23.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "ViewController.h"
#import "Account.h"
#import "FavoriteProgrammingLanguage.h"

@interface ViewController () <FavoriteProgrammingLanguageDelegate>

@end

@implementation ViewController

- (void)joinIntern {
    NSLog(@"インターンに参加する");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Account *takeshi = [[Account alloc]initWithName:@"Takeshi" age:30 sex:@"M" language:@"Objective-C"];
    Account *yumiko = [[Account alloc]initWithName:@"Yumiko" age:22 sex:@"F" language:@"Swift"];
    
    NSArray *accountArray = @[takeshi, yumiko];
    
    // インスタンス
    FavoriteProgrammingLanguage *favoriteProgrammingLanguage = [FavoriteProgrammingLanguage new];
    favoriteProgrammingLanguage.delegate = self;
    
    for (Account *account in accountArray) {
        
        [account printAccount];
        
//        if ([account.language isEqual: @"Objective-C"]) {
//            [favoriteProgrammingLanguage doObjC];
//        } else {
//            NSLog(@"%@さんはインターンに参加できない", account.name);
//        }

    }
}

@end
