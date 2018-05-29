//
//  Model.m
//  StvProject2.4.4
//
//  Created by 竹本大地 on 2018/05/28.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "Model.h"
#import "FMDB.h"
#import "ViewController.h"
#import "Weather.h"

@implementation Model

- (void)registerWeather: (NSMutableArray *)registerContent {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir  = [paths objectAtIndex:0];
    NSString *filePath = [dir stringByAppendingPathComponent:@"weather.db"];
    FMDatabase *fm = [[FMDatabase alloc] initWithPath:filePath];
    
    // datebase用 現在時刻の取得
    NSDate *date = [self fetchDate];
    
    // 引数を登録用に分解
    Weather *weather = [Weather new];
    
    // delete_flgの初期値
    NSInteger delete_false = 0;
    
    NSString *createTableSql =
    @"CREATE TABLE IF NOT EXISTS weatherInfo(wt_id INTEGER PRIMARY KEY,wt_state TEXT,wt_date TEXT,wt_icon TEXT,created DATE,modified DATE,delete_flg TEXT);";
    NSString *insertTableSql =
    @"INSERT INTO weatherInfo(`wt_state`, `wt_date`, `wt_icon`, `created`, `modified`, `delete_flg`) VALUES(:wt_state,:wt_date,:wt_icon,:created,:modified,:delete_flg);";
    
    [fm open];
    
    // APIをぐるぐる回して日付順に登録していく
    int i;
    for (i = 0; i < [registerContent count]; i++) {
        weather = registerContent[i];
        NSString *wt_state = weather.wt_state;
        NSString *wt_date  = weather.wt_date;
        NSString *wt_icon  = weather.wt_icon;
        
        [fm executeUpdate:createTableSql];
        
        [fm executeUpdate:insertTableSql withParameterDictionary:@{@"wt_state":wt_state, @"wt_date":wt_date, @"wt_icon":wt_icon, @"created":date, @"modified":date, @"delete_flg":[NSNumber numberWithInteger:delete_false]}];
    }
    
    [fm close];
}

// select前にdbの有無をチェック
- (BOOL)checkDBTable {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir  = [paths objectAtIndex:0];
    NSString *filePath = [dir stringByAppendingPathComponent:@"weather.db"];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:filePath]) {
        
        NSLog(@"true");
        return NO;
    } else {
        NSLog(@"false");
        return YES;
    }
    
}

- (id)fetchDate {
    
    NSDateFormatter *df = [NSDateFormatter new];
    df.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    NSString *date = [df stringFromDate:[NSDate date]];
    return date;
}


- (id)fetchWeather {
    
    ViewController *viewController = [ViewController new];
    NSMutableArray *weatherArr = [NSMutableArray new];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir  = [paths objectAtIndex:0];
    NSString *filePath = [dir stringByAppendingPathComponent:@"weather.db"];
    FMDatabase *fm = [[FMDatabase alloc] initWithPath:filePath];
    
    NSString *selectTableSql =
    @"SELECT `wt_id`, `wt_state`,`wt_date`,`wt_icon` FROM weatherInfo WHERE `delete_flg` = 0 ORDER BY `wt_id` asc;";
    
    [fm open];
    
    FMResultSet *results = [fm executeQuery:selectTableSql];
    
    while ([results next]) {
        // ↓whileの中に書かないと一行のみを繰り返す
        Weather *weatherList = [Weather new];
        weatherList.wt_state = [results stringForColumn:@"wt_state"];
        weatherList.wt_date  = [results stringForColumn:@"wt_date"];
        weatherList.wt_icon  = [results stringForColumn:@"wt_icon"];
        
        [weatherArr addObject:weatherList];
    }
    [results close];
    [fm close];
    
    [viewController.weatherTable reloadData];
    
    return weatherArr;
}

@end
