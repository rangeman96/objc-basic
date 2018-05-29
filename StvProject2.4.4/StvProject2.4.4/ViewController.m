//
//  ViewController.m
//  StvProject2.4.4
//
//  Created by 竹本大地 on 2018/05/28.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "WeatherTableViewCell.h"
#import "Weather.h"
#import "Model.h"

// 天気APIの取得
const NSString *getWeather = @"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010";

@protocol MyProtocol
@optional
- (void)registerWeather:registerContent;
- (BOOL) checkDBTable;
- (id)fetchWeather;
@end

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, MyProtocol>

@property NSMutableArray *weather;
@property NSArray *forecasts;
@property NSMutableArray *weatherClasses;
@property NSIndexPath *indexPaths;
@property NSInteger countRows;

@property NSMutableArray *weatherLists;
@property BOOL isBoolDB;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.weatherTable.delegate = self;
    self.weatherTable.dataSource = self;
    
    // DBから入れ直す
    Model *dbModel = [Model new];
    // selector生成
    SEL checkSelector = @selector(checkDBTable);
    self.isBoolDB     = [dbModel performSelector:checkSelector];
    
    SEL weatherSelector = @selector(fetchWeather);
    self.weatherLists   = [dbModel performSelector:weatherSelector];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
                     
                     Weather *weatherClass  = [Weather new];
                     weatherClass.wt_date  = forecast[@"date"];
                     weatherClass.wt_state = forecast[@"telop"];
                     weatherClass.wt_icon  = forecast[@"image"][@"url"];
                     
                     [self.weather addObject:weatherClass];
                     [self.weatherTable reloadData];
                 }
             }
         } @catch (NSException *exception) {
             NSLog(@"[ERROR)\n exception[%@]", exception);
         }
         
     } failure:^(NSURLSessionTask *operation, NSError *error) {
         // エラーの場合の処理
         NSLog(@"APIを取得できませんでした。");
     }];
}

// 登録ボタンを押すとDBに登録する
- (IBAction)registerBtn:(id)sender {
    
    // selector生成
    SEL registerSelector = @selector(registerWeather:);
    Model *dbModel = [Model new];
    Model *registerContent = self.weather.mutableCopy;
    
    [dbModel performSelector:registerSelector withObject:registerContent];
    
    [self successAlert];
}

// title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = @"天気予報";
    return title;
}
// cellの数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%lu", (unsigned long)self.weatherLists.count);
    return self.weatherLists.count;
}

// custom cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WeatherTableViewCell *cell =
    (WeatherTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (self.isBoolDB == 1) {
        Weather *weatherList = self.weatherLists[indexPath.row];
        
        // 画像のキャッシュ化
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_queue_t q_main   = dispatch_get_main_queue();
        cell.cellImg.image = nil;
        dispatch_async(q_global, ^{
            NSURL *url       = [NSURL URLWithString:weatherList.wt_icon];
            NSData *data     = [NSData dataWithContentsOfURL:url];
            UIImage *imgData = [UIImage imageWithData:data];
            
            dispatch_async(q_main, ^{
                cell.cellImg.image = imgData;
                [cell layoutSubviews];
            });
        });
        
        cell.cellDateLabel.text = weatherList.wt_date;
        cell.cellTelop.text     = weatherList.wt_state;
    }
    return cell;
}

- (void)successAlert {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Success"
                                          message:@"登録に成功しました。"
                                          preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [self connectAPI];
}

@end
