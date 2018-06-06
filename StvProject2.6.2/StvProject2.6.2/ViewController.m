//
//  ViewController.m
//  StvProject2.6.2
//
//  Created by 竹本大地 on 2018/06/05.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *param1;
@property (weak, nonatomic) IBOutlet UILabel *param2;
@property (weak, nonatomic) IBOutlet UIButton *getParamBtn;

@end

@implementation ViewController

- (IBAction)getParam:(id)sender {
    
    //AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    ViewController *vc = (ViewController *)[[UIApplication sharedApplication] delegate];
    
    self.param1.hidden = NO;
    self.param2.hidden = NO;
    self.param1.text = vc.result[@"s1"];
    self.param2.text = vc.result[@"s2"];
}

@end
