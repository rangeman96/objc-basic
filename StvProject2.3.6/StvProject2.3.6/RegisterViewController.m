//
//  RegisterViewController.m
//  StvProject2.3.6
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
@property (weak, nonatomic) IBOutlet UIToolbar *pickerToolBar;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // textViewの設定
    self.toDoComment.layer.cornerRadius   = 5.0f;
    self.toDoComment.layer.borderColor    = [UIColor grayColor].CGColor;
    self.toDoComment.layer.borderWidth    = 0.5;
    self.myDatePicker.layer.backgroundColor = [UIColor whiteColor].CGColor;
    // pickerを隠しておく
    [self disablePicker];
    // datePickerの初期時間を今日に
    [self.myDatePicker setDate:[NSDate date]];
    // textFieldへのタップジェスチャー
    UITapGestureRecognizer *singleFingerDTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.toDoDate addGestureRecognizer:singleFingerDTap];
}

// タップジェスチャー
- (void)handleSingleTap:(UIGestureRecognizer *)sender {
    [self enablePicker];
}

// textFieldへdatePickerの反映
- (IBAction)datePicker:(id)sender {
    [self datePickTime];
}

// date型のフォーマットを変更する
- (id)datePickTime {
    NSDateFormatter *df = [NSDateFormatter new];
    df.dateFormat = @"YYYY-MM-dd";
    self.toDoDate.text = [df stringFromDate:self.myDatePicker.date];
    return self.toDoDate.text;
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
- (IBAction)doneBtn:(UIBarButtonItem *)sender {
    [self disablePicker];
}
- (void)enablePicker {
    self.pickerToolBar.hidden = NO;
    self.myDatePicker.hidden    = NO;
}
- (void)disablePicker {
    self.pickerToolBar.hidden = YES;
    self.myDatePicker.hidden    = YES;
}

// 登録ボタンの処理
- (IBAction)regiBtn:(id)sender {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    NSString *filePath = [dir stringByAppendingPathComponent:@"tr_todo.db"];
    FMDatabase *fm = [[FMDatabase alloc] initWithPath:filePath];
    
    // delete_flgをtrueに
    NSInteger delete_true = 0;
    
    // Table作成
    NSString *createTableSql =
    @"CREATE TABLE IF NOT EXISTS tr_todo(todo_id INTEGER PRIMARY KEY,todo_title TEXT,todo_contents TEXT,created DATE,modified DATE,limit_date TEXT,delete_flg INTEGER);";
    // tableにinsert
    NSString *insertTableSql = @"INSERT INTO tr_todo(`todo_title`, `todo_contents`, `created`, `modified`, `limit_date`, `delete_flg`) VALUES(:todo_title, :todo_contents, :created, :modified, :limit_date, :delete_flg);";
    
    // スペースをエスケープする
    NSString *trimTodoTitle = [self.toDoTitle.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    // DataBase用 現在時刻の取得
    NSDate *date = [self fetchDate];
    // 期限
    NSString *limit = [self datePickTime];
    
    // DataBase開始
    [fm open];
    // Tableを作成
    [fm executeUpdate:createTableSql];
    
    // Titleが入力されていれば登録、されていなければAlertViewを出す
    if (trimTodoTitle.length != 0) {
        [fm executeUpdate:insertTableSql withParameterDictionary:@{@"todo_title":trimTodoTitle,
                                                                   @"todo_contents":self.toDoComment.text,
                                                                   @"created":date,
                                                                   @"modified":date,
                                                                   @"limit_date":limit,
                                                                   @"delete_flg":[NSNumber numberWithInteger:delete_true]}];
        [self successAlert];
    } else {
        [self titleNullAlert];
    }
    //DataBase終了
    [fm close];
}

// 現在の時間を取得する
- (id)fetchDate {
    NSDateFormatter *df = [NSDateFormatter new];
    df.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    NSString *date = [df stringFromDate:[NSDate date]];
    return date;
    
}

// AlertView
- (void)titleNullAlert {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Alert"
                                          message:@"タイトルを入力して下さい。"
                                          preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (void)successAlert {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Success"
                                          message:@"登録に成功しました。"
                                          preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

@end
