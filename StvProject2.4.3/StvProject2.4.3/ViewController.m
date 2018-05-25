//
//  ViewController.m
//  StvProject2.4.3
//
//  Created by 竹本大地 on 2018/05/25.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "WeatherTableViewCell.h"
#import "Weather.h"

// 天気APIの取得
const NSString *getWeather = @"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *weatherTable;
@property NSMutableArray *weather;
@property NSArray *forecasts;
@property NSMutableArray *weatherClasses;
@property NSDictionary *descriptionText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.weatherTable.delegate = self;
    self.weatherTable.dataSource = self;
    
    [self connectAPI];
}

// APIからいろいろ取ってくる
- (void)connectAPI {
    
    self.weather = [NSMutableArray new];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:(NSString *)getWeather parameters:nil progress:nil
         success:^(NSURLSessionTask *task, id responseObject)
     {
         @try {
             if ((self.forecasts = responseObject[@"forecasts"])) {
                 for (NSDictionary *forecast in self.forecasts) {
                     
                     Weather *weatherClass = [Weather new];
                     weatherClass.cellDateLabel = forecast[@"dateLabel"];
                     weatherClass.cellTelop     = forecast[@"telop"];
                     weatherClass.cellImg       = forecast[@"image"][@"url"];
                     
                     [self.weather addObject:weatherClass];
                     [self.weatherTable reloadData];
                 }
             }
             self.descriptionText = responseObject[@"description"];
         } @catch (NSException *exception) {
             NSLog(@"[ERROR)\n exception[%@]", exception);
         }
         
     } failure:^(NSURLSessionTask *operation, NSError *error) {
         // エラーの場合の処理
         NSLog(@"APIを取得できませんでした。");
     }];
}

// title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = @"天気予報";
    return title;
}
// cellの数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.forecasts.count;
}
// custom cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WeatherTableViewCell *cell =
    (WeatherTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Weather *wetherClass = [Weather new];
    wetherClass = self.weather[indexPath.row];
    
    // 画像のキャッシュ化
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t q_main   = dispatch_get_main_queue();
    cell.cellImg.image = nil;
    dispatch_async(q_global, ^{
        NSURL *url       = [NSURL URLWithString:wetherClass.cellImg];
        NSData *data     = [NSData dataWithContentsOfURL:url];
        UIImage *imgData = [UIImage imageWithData:data];
        
        dispatch_async(q_main, ^{
            cell.cellImg.image = imgData;
            [cell layoutSubviews];
        });
    });
    
    cell.cellDateLabel.text = wetherClass.cellDateLabel;
    cell.cellTelop.text     = wetherClass.cellTelop;
    cell.cellText.text      = self.descriptionText[@"text"];
    
    return cell;
}

@end
