//
//  ViewController.m
//  StvProject2.1.8
//
//  Created by 竹本大地 on 2018/05/16.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//プロパティ定義
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (strong, nonatomic) NSDateFormatter *dateData;

//メソッド定義
- (void)settingDate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingDate];
}

// ラベルの初期値を今日の日付にする
- (void)settingDate {
    // 今日の日付を取得
    NSDate *todaysdate = [NSDate new];
    todaysdate = [NSDate date];
    // 日付データをインスタンス化
    self.dateData = [NSDateFormatter new];
    // 日付データに型をセット
    self.dateData.dateFormat = @"yyyy年M月dd日";
    // ラベルに日付を反映
    self.dateLabel.text = [self.dateData stringFromDate:todaysdate];
}

    //PickerDateView
- (IBAction)dateChangedAction:(id)sender {
    // datapikerが変更されるたびにその日付を取得してpickerに入れる
    self.dateLabel.text = [self.dateData stringFromDate:self.datePicker.date];
}

// ラベルをタップしたら　”PickerView” と　”toolBar” を表示
- (IBAction)touchLabel:(id)sender {
    self.datePicker.hidden = NO;
    self.toolBar.hidden = NO;
}

//背景タップしたら　”PickerView” と　”toolBar” を非表示。
- (IBAction)closePickerAndToolBar:(id)sender {
    self.datePicker.hidden = YES;
    self.toolBar.hidden = YES;
}

@end
