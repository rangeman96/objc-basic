//
//  Model.h
//  StvProject2.4.4
//
//  Created by 竹本大地 on 2018/05/28.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

- (void)registerWeather: (NSMutableArray *)registerContent;

- (BOOL)checkDBTable;

@end
