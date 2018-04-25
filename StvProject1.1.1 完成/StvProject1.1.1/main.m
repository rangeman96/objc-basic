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
        
        BOOL myBool1 = YES;
        NSLog(@"%d", myBool1); //output = 1
        
        BOOL myBool2 = NO;
        NSLog(@"%d", myBool2); //output = 0
        
        NSString *myName = @"Daichi Takemoto";
        NSLog(@"%@", myName); //output = Daichi Takemoto
        
        NSInteger birth = 1996;
        NSLog(@"%ld", (long)birth);//output = 1996
        
        NSNumber *myAge = @22;
        NSLog(@"%@", myAge); //output age = 22
        
    }
    return 0;
}
