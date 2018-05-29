//
//  ViewController.h
//  StvProject2.4.5
//
//  Created by 竹本大地 on 2018/05/29.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const VCGetWeather;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *weatherTable;
@property NSMutableArray *weatherLists;

@end

