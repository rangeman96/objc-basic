//
//  ViewController.m
//  test2.1.7
//
//  Created by 竹本大地 on 2018/05/15.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

//
//  ViewController.m
//  StvProject2.1.7
//
//  Created by 竹本大地 on 2018/05/15.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// プロパティを定義
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

// 最大入力文字数の定数を用意
//static int const maxTextLength = 30;

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}







    // キーボードが表示：消す
    /* if (self.textField.isFirstResponder) {
     [self.textField resignFirstResponder];
     }*/

/*- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    // テキストフィールドが空欄かどうかチェック
    if (textField.text.length == 0) {
        textField.enablesReturnKeyAutomatically = YES;
    }
    return YES;
}
 
// テキストの文字数をチェックしているメソッド
// 空欄の場合はリターンキーを非活性にする
- (BOOL)_mytextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    // 空欄チェック
    if (textField.text.length == 0) {
        textField.enablesReturnKeyAutomatically = YES;
    }
    // 入力済みのテキストを初期値として取得
    NSMutableString *inputedText = [textField.text mutableCopy];
    // 入力済みのテキストと入力が行われたテキストを結合
    [inputedText replaceCharactersInRange:range withString:string];
    
    // 入力中のテキストが30を超えたらそれ以上の入力を無効にする
    if (inputedText.length > maxTextLength) {
        NSLog(@"%d文字以上は入力できません。", maxTextLength);
        return NO;
    }
    return YES;
}*/










/*
UITextField *_textField;
NSUInteger _maxLength;

NSString *_previousText;
NSRange _lastReplaceRange;
NSString *_lastReplacementString;

- (instancetype)init
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:_textField];
    _maxLength = 30;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    _previousText = textField.text;
    _lastReplaceRange = range;
    _lastReplacementString = string;
    
    return YES;
}

- (void)_textFieldDidChange:(NSNotification *)notification
{
    UITextField *textField = (UITextField *)notification.object;
    
    if (textField.markedTextRange) {
        return;
    }
    
    if ([textField.text length] > _maxLength) {
        NSInteger offset = _maxLength - [textField.text length];
        
        NSString *replacementString = [_lastReplacementString substringToIndex:([_lastReplacementString length] + offset)];
        NSString *text = [_previousText stringByReplacingCharactersInRange:_lastReplaceRange withString:replacementString];
        
        UITextPosition *position = [textField positionFromPosition:textField.selectedTextRange.start offset:offset];
        UITextRange *selectedTextRange = [textField textRangeFromPosition:position toPosition:position];
        
        textField.text = text;
        textField.selectedTextRange = selectedTextRange;
    }
}
*/





// 背景タップでキーボードを非表示
- (IBAction)tapBackground:(id)sender {
    [self.view endEditing:YES];
}

@end

