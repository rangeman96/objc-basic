//
//  ViewController.m
//  StvProject2.1.1-2
//
//  Created by 竹本大地 on 2018/05/11.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *startLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.startLabel.text = NSLocalizedString(@"Objc-C course has started", nil);
}



@end
