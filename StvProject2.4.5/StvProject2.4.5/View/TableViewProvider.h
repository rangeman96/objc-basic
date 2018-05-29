//
//  TableViewProvider.h
//  StvProject2.4.5
//
//  Created by 竹本大地 on 2018/05/29.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"
@import UIKit;

@interface TableViewProvider : NSObject <UITableViewDataSource>

@property (strong, nonatomic)NSMutableArray<Weather *> *weatherLists;

@end
