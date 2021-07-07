//
//  DeviseSize.m
//  customMadeCalendar
//
//  Created by 竹本大地 on 2018/06/07.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "DeviseSize.h"

@implementation DeviseSize

int deviceBoundsHeight;
int deviceBoundsWidth;

//現在起動中のデバイス名の取得メソッド
+ (NSString *)getNowDisplayDevice{
    
    deviceBoundsWidth = [[UIScreen mainScreen] bounds].size.width;
    deviceBoundsHeight = [[UIScreen mainScreen] bounds].size.height;
    
    NSString *deviceType = [NSString new];
    
    //iPhoneSE
    if(deviceBoundsWidth == 320 && deviceBoundsHeight == 568){
        
        deviceType = @"iPhoneSE";
        
        //iPhone8
    }else if (deviceBoundsWidth == 375 && deviceBoundsHeight == 667){
        
        deviceType = @"iPhone8";
        
        //iPhone8plus
    }else if (deviceBoundsWidth == 414 && deviceBoundsHeight == 736){
        
        deviceType = @"iPhone8plus";
        
    }
    return deviceType;
}

@end
