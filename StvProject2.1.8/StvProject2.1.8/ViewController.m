//
//  ViewController.m
//  StvProject2.1.8
//
//  Created by 竹本大地 on 2018/05/16.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

//プロパティを定義
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *bloodTypePicker;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (strong, nonatomic) NSArray *picArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // delegate,datasourceの設定
    self.bloodTypePicker.delegate = self;
    self.bloodTypePicker.dataSource = self;
    
    [self readyPickerView];
}

//PickerViewの用意
- (void)readyPickerView {
    self.picArr = @[@"A型", @"B型", @"AB型", @"O型", @"others"];
}

//デリゲートメソッドの実装
//PickerViewの列数は１とする
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

//列ごとの選択肢(Array)の数を返す(どこに返す？)
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.picArr.count;
}

//表示する内容を返す
- (NSString*)pickerView:(UIPickerView*)pickerView
           titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.picArr[row];
}

// 選択されたpickerviewを取得
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.resultLabel.text = [NSString stringWithFormat:@"私の血液型は%@です。",self.picArr[row]];
}

//LabelがTapされた時の処理
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if([event touchesForView:self.resultLabel]) {
        self.bloodTypePicker.hidden = NO;
        self.toolBar.hidden = NO;
    } else {
        self.bloodTypePicker.hidden = YES;
        self.toolBar.hidden = YES;
        }
    }

//TapでPickerViewとtoolBarを非表示にする。
- (IBAction)pickerViewAndToolBar:(id)sender {
    self.bloodTypePicker.hidden = YES;
    self.toolBar.hidden = YES;
}

@end
