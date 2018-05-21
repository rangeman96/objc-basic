//
//  ViewController.m
//  StvProject2.1.17
//
//  Created by 竹本大地 on 2018/05/21.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)goToB:(id)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
    // initial view controllerを取得する
    UIViewController *secondViewController = [mainStoryboard instantiateInitialViewController];
    [self presentViewController:secondViewController animated:YES completion:nil];
}

@end
