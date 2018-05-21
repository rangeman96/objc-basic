//
//  SecondViewController.m
//  StvProject2.1.17
//
//  Created by 竹本大地 on 2018/05/21.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)backButton:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
