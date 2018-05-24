//
//  RegisterViewController.m
//  StvProject2.3.5
//
//  Created by 竹本大地 on 2018/05/24.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//


#import "RegisterViewController.h"
#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "FMDB.h"

@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *toDoTitle;
@property (weak, nonatomic) IBOutlet UITextView *toDoComment;
@property (weak, nonatomic) IBOutlet UITextField *toDoDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *myDatePicker;
@property (weak, nonatomic) IBOutlet UIToolbar *myToolBar;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // taxtViewの設定
    self.toDoComment.layer.cornerRadius = 5.0f;
    [[self.toDoComment layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.toDoComment layer] setBorderWidth:0.5];
    [[self.myDatePicker layer]  setBackgroundColor:[[UIColor whiteColor] CGColor]];
    // pickerを隠しておく
    [self disablePicker];
    // datePickerの初期時間を今日に
    [self.myDatePicker setDate:[NSDate date]];
    // textFieldへのタップジェスチャー
    UITapGestureRecognizer *singleFingerDTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.toDoDate addGestureRecognizer:singleFingerDTap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// タップジェスチャー
- (void)handleSingleTap:(UIGestureRecognizer *)sender {
    [self enablePicker];
}

// textFieldへdatePickerの反映
- (IBAction)datePicker:(id)sender {
    NSDateFormatter *df = [NSDateFormatter new];
    df.dateFormat = @"YYYY-MM-dd";
    self.toDoDate.text = [df stringFromDate:self.myDatePicker.date];
}

// タッチイベント
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([event touchesForView:self.toDoDate]) {
        [self enablePicker];
    } else {
        [self disablePicker];
    }
}

// doneボタンを押した時の処理

- (IBAction)doneButton:(id)sender {
    [self disablePicker];
}
- (void)enablePicker {
    self.myToolBar.hidden = NO;
    self.myDatePicker.hidden    = NO;
}
- (void)disablePicker {
    self.myToolBar.hidden = YES;
    self.myDatePicker.hidden    = YES;
}

// 登録ボタンの処理
- (IBAction)entryButton:(id)sender {
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    NSString *filePath = [dir stringByAppendingPathComponent:@"tr_todo.db"];
    FMDatabase *fm = [[FMDatabase alloc] initWithPath:filePath];
    
    // delete_flgの初期値
    NSInteger delete_false = 0;
    // datebase用 現在時刻の取得
    NSDate *date = [self fetchDate];
    
    // Table作成
    NSString *createTableSql =
    @"CREATE TABLE IF NOT EXISTS tr_todo(todo_id INTEGER PRIMARY KEY,todo_title TEXT,todo_contents TEXT,created DATE,modified DATE,limit_date DATE,delete_flg TEXT);";
    // tableにinsert
    NSString *insertTableSql = @"INSERT INTO tr_todo(todo_title, todo_contents, created, modified, limit_date, delete_flg) VALUES(?,?,?,?,?,?);";
    
    // 期限
    NSString *limit = (NSString *)self.myDatePicker.date;
    
    // DataBase ON
    [fm open];
    // Tableを作成
    [fm executeUpdate:createTableSql];
    
    // Titleが入力されていれば登録、されていなければAlertviewを出す
    if (self.toDoTitle.text.length != 0) {
        [fm executeUpdate:insertTableSql, self.toDoTitle.text, self.toDoComment.text, date, date, limit, [NSNumber numberWithInteger:delete_false]];
        [self successAlert];
    } else {
        [self titleNullAlert];
    }
    [fm close];
    
    NSLog(@"%@", NSHomeDirectory());
}

- (id)fetchDate {
    
    NSDateFormatter *df = [NSDateFormatter new];
    df.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    NSString *date = [df stringFromDate:[NSDate date]];
    return date;
}

- (double)convertUnixTimeFromDate:(NSDate *)now {
    double unixtime = [now timeIntervalSince1970];
    return unixtime;
}
- (NSDate *)convertDateFromUnixTime:(double)unixtime {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:unixtime];
    return date;
}

// alertview
- (void)titleNullAlert {
    UIAlertController *ac = [UIAlertController
                             alertControllerWithTitle:@"Alert"
                             message:@"タイトルを入力して下さい。"
                             preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:ac animated:YES completion:nil];
}
- (void)successAlert {
    UIAlertController *ac = [UIAlertController
                             alertControllerWithTitle:@"Alert"
                             message:@"登録に成功しました。"
                             preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:ac animated:YES completion:nil];
}

@end
