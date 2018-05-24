//
//  SecondViewController.m
//  StvProject2.3.4-2
//
//  Created by 竹本大地 on 2018/05/24.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//


#import "SecondViewController.h"
#import "FMDatabase.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UITextField *toDoTitle;
@property (weak, nonatomic) IBOutlet UITextView *toDoComment;
@property (weak, nonatomic) IBOutlet UIToolbar *myToolBar;
@property (weak, nonatomic) IBOutlet UIDatePicker *myDatePicker;
@property (weak, nonatomic) IBOutlet UITextField *toDoDate;

@end

@implementation SecondViewController


- (IBAction)datePickerView:(id)sender {
NSDateFormatter *df = [NSDateFormatter new];
    df.dateFormat = @"YY/MM/dd";
    self.toDoDate.text = [df stringFromDate:self.myDatePicker.date];
}


- (IBAction)entry:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    NSString *filePath = [dir stringByAppendingPathComponent:@"tr_todo.db"];
    FMDatabase *fm = [[FMDatabase alloc] initWithPath:filePath];
    
    // Table作成
    NSString *createTableSql =
    @"CREATE TABLE IF NOT EXISTS tr_todo(todo_id INTEGER PRIMARY KEY,todo_title TEXT,todo_contents TEXT,created INTEGER,modified INTEGER,limit_date INTEGER,delete_flg INTEGER);";
    // tableにinsert
    NSString *insertTableSql = @"INSERT INTO tr_todo(todo_title, todo_contents, created, modified, limit_date, delete_flg) VALUES(?,?,?,?,?,?);";
    
    // 現在の時間を取得
    NSString* nowTime = [self dateCapture];
    NSString *limit = self.toDoDate.text;
    // database開始
    [fm open];
    // tableを作成
    [fm executeUpdate:createTableSql];
    
    // titleが入力されていれば登録、されていなければalertviewを出す
    if (self.toDoTitle.text.length != 0) {
        [fm executeUpdate:insertTableSql, self.toDoTitle, self. toDoComment, nowTime, nowTime, limit, @"0"];
        NSLog(@"ok");
    } else {
        [self titleNullAlert];
        NSLog(@"ng");
    }
    [fm close];
    
    NSLog(@"%@", NSHomeDirectory());
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.myDatePicker addTarget:self action:@selector(pickerDidChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // キーボードが表示：消す
    if (self.toDoTitle.isFirstResponder) {
        [self.toDoTitle resignFirstResponder];
    }
    
    if (self.toDoDate.isFirstResponder) {
        [self.toDoDate resignFirstResponder];
    }
    
    if (self.toDoComment.isFirstResponder) {
        [self.toDoComment resignFirstResponder];
    }
}

- (void)pickerDidChange:(UIDatePicker *)datePicker {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    NSString *dateString = [dateFormatter stringFromDate:datePicker.date];
}

// 現在の時間を取得する
- (id)dateCapture {
    NSDateFormatter *dateFormat = [NSDateFormatter new];
    [dateFormat setDateFormat:@"YY/MM/dd HH:mm:ss"];
    NSString *setToday = [dateFormat stringFromDate:[NSDate date]];
    return setToday;
}

// alertview
- (void)titleNullAlert {
    UIAlertController *ac = [UIAlertController
                             alertControllerWithTitle:@"Akantte"
                             message:@"タイトルなしはさすがに厳つない？"
                             preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:@"ほな入れますわ" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:ac animated:YES completion:nil];
}

@end
