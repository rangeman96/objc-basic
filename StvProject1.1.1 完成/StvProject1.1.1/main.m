//
//  main.m
//  StvProject1.1.1
//
//  Created by 竹本大地 on 2018/04/25.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        BOOL mybool1 = YES;
        NSLog(@"%d", mybool1); //output = 1
        
        BOOL mybool2 = NO;
        NSLog(@"%d", mybool2); //output = 0
        
        NSString *myname = @"Daichi Takemoto";
        NSLog(@"%@", myname); //output = Daichi Takemoto
        
        NSInteger Number = 1996;
        NSLog(@"%ld", (long)Number);//output = 1996
        
        NSNumber *myage = @22;
        NSLog(@"%@", myage); //output age = 22
        
    }
    return 0;
}
