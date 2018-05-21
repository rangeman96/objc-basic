//
//  ViewController.m
//  StvProject2.1.12
//
//  Created by 竹本大地 on 2018/05/20.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSArray *imageList1;
@property NSArray *imageList2;
@property NSArray *sectionList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //画像を配列(Array)に入れる
    self.imageList1 = @[@"car1.png",
                       @"car2.png",
                       @"car3.png",
                       @"car4.png",
                       @"car5.png"];
    self.imageList2 = @[@"1.png",
                        @"2.png",
                        @"3.png",
                        @"4.png",
                        @"5.png"];
    self.sectionList = @[@"車",
                         @"絶景"];
    
    //デレゲート＆データソース接続
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
}

// セルの数 (numberOfRowsInSection)
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //セクション
    switch (section) {
        case 0:
            return self.imageList1.count;
            break;
        case 1:
            return self.imageList2.count;
            break;
        default:
            return 0;
            break;
    }
    //return self.imageList.count;
}

// セルの中身 (cellForRowAtIndexPath)
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // セルを取得 (インスタンス化)
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    //cell.imageView.image = [UIImage imageNamed:self.imageList[indexPath.row]];
    
    cell.titleLabel.text = @"車と絶景の画像";
    
    //セクション分け条件分岐
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:self.imageList1[indexPath.row]];
    } else if (indexPath.section == 1) {
        cell.imageView.image = [UIImage imageNamed:self.imageList2[indexPath.row]];
    }
    
    return cell;
}

// セクション数を指定
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sectionList.count;
}

@end
