//
//  ViewController.m
//  StvProject1.1.5
//
//  Created by 竹本大地 on 2018/05/08.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"
#import "Account.h"
#import "FavoriteProgrammingLanguage.h"

@interface ViewController ()<FavoriteProgrammingLanguageDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end

//@implementation ViewController
//
//   - (void)viewDidLoad {
//      [super viewDidLoad];
//
//       Account *takeshi = [[Account alloc] initWithName:@"takeshi" age:30 sex:@"man" words:@"Objective-C"];
//       Account *yumiko = [[Account alloc] initWithName:@"yumiko" age:22 sex:@"woman" words:@"Java"];
//
//       NSArray *members = @[takeshi, yumiko];
//       for (Account *member in members){
//            [member printAccount]; //AccountからprintAcconutメソッドを呼ぶ
//       }
//   }
//
//@end
//
//
//#import "ViewController.h"
//#import "FavoriteProgrammingLanguage.h"
//#import "Account.h"
//
//@interface ViewController ()<FavoriteProgrammingLanguageDelegate>
//
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
//@end
