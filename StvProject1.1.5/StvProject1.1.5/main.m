//
//  main.m
//  StvProject1.1.5
//
//  Created by 竹本大地 on 2018/05/08.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "FavoriteProgrammingLanguage.h"
#import "Account.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        // 個人の設定
        Account *takeshi = [[Account new]
                        initWithName:@"takeshi"
                        age:30
                        sex:@"man"
                        words:@"Objective-C"];
        
        Account *yumiko = [[Account new]
                        initWithName:@"yumiko"
                        age:22
                        sex:@"woman"
                        words:@"Swift"];
        
        
        NSArray *team = @[takeshi, yumiko];
        
        for (Account *person in team){
            [person printAccount];
        }
        return 0;
    }
}
