//
//  ViewController.m
//  StvProject2.1.4
//
//  Created by 竹本大地 on 2018/05/14.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }

- (IBAction)tap: (id)sender {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"UIAlertControllerStyle.Alert" message:@"Alert" preferredStyle:UIAlertControllerStyleAlert];
    
    // addActionした順に左から右にボタンが配置されます
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"OK!");
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"Cancel!");
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];

}
@end
