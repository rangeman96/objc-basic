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
@property NSArray *imgScenery;
@property NSArray *imgCar;
@property NSArray *sectionList;

@end

// セクションの高さを用意
static CGFloat const CellHeight = 30;
// セルの基本値の高さ
//static CGFloat const cellRowEstimateHeigt = 100;


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Arrayに画像を入れる
    self.imgScenery = @[@"1.png",
                        @"2.png",
                        @"3.png",
                        @"4.png",
                        @"5.png"];
    
    self.imgCar = @[@"car0.png",
                    @"car1.png",
                    @"car2.png",
                    @"car3.png",
                    @"car4.png",
                    @"car5.png"];
    
    self.sectionList = @[@"絶景", @"車"];
    
    //デリゲート//データソース
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

// セルの数 (numberOfRowsInSection)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //セクション
    switch (section) {
        case 0:
            return self.imgScenery.count;
            break;
        case 1:
            return self.imgCar.count;
            break;
        default:
            return 0;
            break;
    }
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
        //NSArray *items = dic[@"Root"];
    
    //plistを呼ぶ
    //セクション分け条件分岐
    if (indexPath.section == 0) {
        NSArray *items = dic[@"Root1"];
        cell.imageView.image = [UIImage imageNamed:self.imgScenery[indexPath.row]];
        cell.titleLabel.text = items[indexPath.row][@"title"];
        cell.subTitleLabel.text = items[indexPath.row][@"subTitle"];
        
    } else if (indexPath.section == 1) {
        NSArray *items = dic[@"Root2"];
        cell.imageView.image = [UIImage imageNamed:self.imgCar[indexPath.row]];
        cell.titleLabel.text = items[indexPath.row][@"title"];
        cell.subTitleLabel.text = items[indexPath.row][@"subTitle"];
    }
    return cell;
}
    
//セクション数を指定
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionList.count;
}

// セクションのヘッダータイトル
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sectionList[section];
}
// セクションの高さ
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CellHeight;
}


@end
