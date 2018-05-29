//
//  Model.h
//  StvProject2.4.5
//
//  Created by 竹本大地 on 2018/05/29.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@protocol DataModelDelegate<NSObject>

- (void)reloadData;

@end

@interface Model : NSObject

@property NSMutableArray *weatherArr;
@property (weak, nonatomic) id<DataModelDelegate> delegate;

- (void)registerWeather:registerContents;
- (id)fetchDate;
- (void)fetchWeather;

@end
