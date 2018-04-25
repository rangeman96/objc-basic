//
//  main.m
//  StvProject1.1.2
//
//  Created by 竹本大地 on 2018/04/25.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
       
        NSArray *nameNwa = @[@"Easy-E", @"Dr.dre",@"IceCube"];//Array
            NSLog(@"%@",nameNwa);//output
        
        NSArray *nameCar = @[@"Porsche", @"Audi",@"BMW"];//Array
        for(NSString *strCName in nameCar){//高速列挙
            NSLog(@"%@",strCName);//output
        }
        int idx = 1;
        NSString *strDisp = nameCar[idx];//指定した配列にアクセスする
        NSLog(@"%i番目は%@です。",idx,strDisp);//output
        
        NSInteger cnt = [nameNwa count];//要素数の取得
        NSNumber *intCnt = [NSNumber numberWithInteger:cnt];//NSNumberに変換
        NSLog(@"N.W.Aの主要メンバーは%@人です",intCnt);//output
        
        NSDictionary *germanCar = @{@"911" : @"Porsche",//Dictionary
                                @"RS6" : @"Audi",
                                @"G63" : @"Mercedes",
                                @"M4" : @"BMW"};
        
        strDisp = [germanCar objectForKey:@"G63"];
        NSLog(@"%@",strDisp);//output
        
        for(NSString *key in germanCar){//高速列挙
            NSLog(@"%@ : %@",key,germanCar[key]);//output
        }
    }
     return 0;
}
