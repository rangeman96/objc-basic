//
//  ViewController.m
//  StvProject2.1.10
//
//  Created by 竹本大地 on 2018/05/18.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
//プロパティ宣言
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *imageList;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //Arrayに画像を入れる
    self.imageList = @[@"1.png",@"2.png",@"3.png",@"4.png",@"5.png"];
    //デリゲート
    self.tableView.delegate = self;
    //データソース
    self.tableView.dataSource = self;
}

// セルの数 (numberOfRowsInSection)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageList.count;
}

// セルの中身 (cellForRowAtIndexPath)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // セルを取得 (インスタンス化)
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSBundle *bundle = [NSBundle mainBundle];
    
    //読み込むファイルパスを指定
    NSString *path = [bundle pathForResource:@"Property List" ofType:@"plist"];

    //plistからデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *items = dic[@"Root"];
    
    //plistを呼ぶ
    cell.imageView.image = [UIImage imageNamed:self.imageList[indexPath.row]];
    cell.titleLabel.text = items[indexPath.row][@"title"];
    cell.subTitleLabel.text = items[indexPath.row][@"subTitle"];
    
    return cell;
}

@end
