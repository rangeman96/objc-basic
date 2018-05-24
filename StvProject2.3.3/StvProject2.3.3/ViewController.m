//
//  ViewController.m
//  StvProject2.3.3
//
//  Created by 竹本大地 on 2018/05/22.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"

//デリゲートに接続
@interface ViewController ()<UITableViewDelegate>

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    //データベースの呼び出し
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    FMDatabase *db = [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"test.db"]];

    // tableとカラムの作成(sqlコマンドの作成)
    NSString *createTableCommand = @"CREATE TABLE IF NOT EXISTS tr_todo(id INTEGER PRIMARY KEY,todo_id INTEGER,todo_title TEXT,todo_contents TEXT,created INTEGER,modified INTEGER,limit_date INTEGER,delete_flg TEXT);";
    // DBを開ける
    [db open];
    // 作成コマンド実行
    [db executeUpdate:createTableCommand];
    // DBを閉じる
    [db close];
    
    NSLog(@"%@", NSHomeDirectory());

}

@end
