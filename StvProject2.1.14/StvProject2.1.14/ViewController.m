//
//  ViewController.m
//  StvProject2.1.14
//
//  Created by 竹本大地 on 2018/05/20.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSArray *imageList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageList = @[@"car1.jpg",
                       @"car2.jpg",
                       @"car3.jpg",
                       @"car4.jpg",
                       @"car5.jpg"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

// セルの数 (numberOfRowsInSection)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageList.count;
}

// セルの中身 (cellForRowAtIndexPath)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // セル取得
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSBundle* bundle = [NSBundle mainBundle];
    //読み込むファイルパスを指定
    NSString* path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    
    NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *items = dic[@"Root"];
    
    cell.imageView.image = [UIImage imageNamed:self.imageList[indexPath.row]];
    cell.titleLabel.text = items[indexPath.row][@"title"];
    cell.subTitleLabel.text = items[indexPath.row][@"subTitle"];
    
    return cell;
}

@end
