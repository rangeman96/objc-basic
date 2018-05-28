//
//  ContentViewController.m
//  StvProject2.1.16-2
//
//  Created by 竹本大地 on 2018/05/28.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()

@property (weak, nonatomic) IBOutlet UILabel *pageNumber;

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // PageView.storyboard上のラベルに外部から渡された文字列を表示
    self.pageNumber.text = self.labelText;
}

@end
