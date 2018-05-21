//
//  ViewController.m
//  StvProject2.1.1
//
//  Created by 竹本大地 on 2018/05/10.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *startObjc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self setTitle:[]]
    
    //NSString *label = @"Obj-C講座をスタートしました。";
    //NSLog(@"%@", label); //output
    
    
    //NSLocalizedString(@"key", @"comment");
    //self.title = NSLocalizedString(@"Obj-C course was started", comment: @"Obj-C course was started");
    NSString* strLabel = NSLocalizedString(@"Obj-C course was started", @"Obj-C course was started");
    //NSLog();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
