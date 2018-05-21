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
@property NSArray *imageList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //画像を配列(Array)に入れる
    self.imageList = @[@"car1.png",
                       @"car2.png",
                       @"car3.png",
                       @"car4.png",
                       @"car5.png"];
    
    //デレゲート＆データソース接続
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
}

// セルの数 (numberOfRowsInSection)
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageList.count;
}

// セルの中身 (cellForRowAtIndexPath)
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // セルを取得 (インスタンス化)
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:self.imageList[indexPath.row]];
    
    return cell;
}

@end


