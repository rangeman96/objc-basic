//
//  ViewController.m
//  StvProject2.4.5
//
//  Created by 竹本大地 on 2018/05/29.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "ViewController.h"
#import "WeatherTableViewCell.h"
#import "Weather.h"
#import "Model.h"
#import "ModelAPI.h"
#import "TableViewProvider.h"

// 天気APIの取得
NSString *const VCGetWeather = @"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010";


@interface ViewController () <UITableViewDelegate, DataModelDelegate>

@property Model *dbModel;
@property ModelAPI *apiModel;
@property Weather *registerContents;
@property TableViewProvider *provider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // インスタンス化
    self.dbModel  = [Model new];
    self.apiModel = [ModelAPI new];
    self.provider = [TableViewProvider new];
    self.registerContents  = [Weather new];
    
    // delegate,dataSource
    self.dbModel.delegate = self;
    self.weatherTable.delegate = self;
    
    self.registerContents = [self.apiModel connectAPI];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.weatherTable reloadData];
    [super viewWillAppear:animated];
    
    self.provider = [TableViewProvider new];
    self.weatherTable.dataSource = self.provider;
    
    [self.dbModel fetchWeather];
    
    self.provider.weatherLists = [self.dbModel.weatherArr mutableCopy];
}

// 登録ボタンを押すとDBに登録する
- (IBAction)registerBtn:(id)sender {
    
    self.apiModel = [ModelAPI new];

    [self.dbModel registerWeather:self.registerContents];

    [self successAlert];
    [self.dbModel fetchWeather];
}

- (void)successAlert {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Success"
                                          message:@"登録に成功しました。"
                                          preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];

    [self presentViewController:alertController animated:YES completion:^{
        [self.dbModel fetchWeather];
        self.provider.weatherLists = [self.dbModel.weatherArr mutableCopy];
        [self reloadData];
    }];
}

- (void)reloadData {
    [self.weatherTable reloadData];
}

@end
