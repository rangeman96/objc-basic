//
//  main.m
//  StvProject1.1.3
//
//  Created by 竹本大地 on 2018/04/25.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        //if文
        NSInteger n = 1;
        if (n == 0) {
            NSLog(@"なし");
        }
        if (n == 1) {
            NSLog(@"あり");
        }
        
        //if~else文
        NSInteger w = 26;
        if (w >= 0 && w <= 24) {
            NSLog(@"晴れ");
        }else{
            NSLog(@"雨");
        }
        
       //if〜else if文
        NSInteger s = 50;
        if (s >= 70 && s <= 100) {
            NSLog(@"Aクラス");
        }else if (s >= 40 && s <= 69) {
            NSLog(@"Bクラス");
        }else{
            NSLog(@"Cクラス");
        }
        
        //三項演算子
        NSInteger money = 10000;
        money > 5000 ? NSLog(@"Expensive") : (@"Cheap");
        
        //for文
        for (int i=0; i<10; i++) {
           NSLog(@"ピザ");
        }
        
        //高速列挙構文
        NSArray *nameCar = @[@"Porsche", @"Audi", @"BMW"];
        for (NSString *strCName in nameCar) {
           NSLog(@"%@", strCName);
        }
        
        //switch文
        NSInteger rollCall = 1;
        switch (rollCall) {
            case 1:
                NSLog(@"Attend"); //出席
                break;
            case 2:
                NSLog(@"Default"); //欠席
                break;
            default:
                NSLog(@"Late"); //遅刻
                break;
        }
    return 0;
    }
}
