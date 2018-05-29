//
//  ModelAPI.h
//  StvProject2.4.5
//
//  Created by 竹本大地 on 2018/05/29.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface ModelAPI : NSObject

@property (nonatomic) NSMutableArray *weather;
@property NSArray *forecasts;
@property NSMutableArray *weatherClasses;

- (id)connectAPI;

@end
