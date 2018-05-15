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
       
        NSArray *nameNwa = @[@"Easy-E", @"Dr.dre", @"IceCube"]; //Array
        //NSLog(@"%@", nameNwa); //output
        NSLog(@"%@", nameNwa[1]); //指定した値だけをoutput
        
        NSDictionary *germanCar = @{@"911" : @"Porsche", //Dictionary
                                    @"RS6" : @"Audi",
                                    @"G63" : @"Mercedes",
                                    @"M4" : @"BMW"};
        
        NSLog(@"%@", germanCar[@"RS6"]); //output
    }
     return 0;
}
