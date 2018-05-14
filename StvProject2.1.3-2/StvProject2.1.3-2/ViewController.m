//
//  ViewController.m
//  StvProject2.1.3-2
//
//  Created by 竹本大地 on 2018/05/14.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *showimgLabel;

@property UIImage *image1;
@property UIImage *image2;
@property UIImage *image3;
@property UIImage *image4;
@property UIImage *image5;
@property NSArray *backImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.image1 = [UIImage imageNamed: @"1"];
    self.image2 = [UIImage imageNamed: @"2"];
    self.image3 = [UIImage imageNamed: @"3"];
    self.image4 = [UIImage imageNamed: @"4"];
    self.image5 = [UIImage imageNamed: @"5"];
    self.backImageView = @[self.image1, self.image2, self.image3, self.image4, self.image5];

}

- (IBAction)swipe:(id)sender {
    self.showimgLabel.image = self.backImageView[arc4random_uniform(5)];
}

@end
