//
//  CalendarViewController.m
//  SimpleCalendar
//
//  Created by hiraya.shingo on 2015/01/29.
//  Copyright (c) 2015年 hiraya.shingo. All rights reserved.
//

#import "CalendarViewController.h"
#import "DayCell.h"

@implementation NSDate (Extension)

//カレンダー表示
- (NSDate *)monthAgoDate {
    
    NSInteger addValue = -1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.month = addValue;
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}


- (NSDate *)monthLaterDate {
    
    NSInteger addValue = 1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.month = addValue;
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

@end


static NSString * const ReuseIdentifier = @"Cell";
// 週の数
static NSUInteger const DaysPerWeek = 7;
// Cell幅
static CGFloat const CellMargin = 2.0f;

@interface CalendarViewController ()

// プロパティを定義
@property (nonatomic, strong) NSDate *selectedDate;

@end

@implementation CalendarViewController

#pragma mark - LifeCycle methods
- (void)viewDidLoad {
    [super viewDidLoad];
    //現在の日付を取得
    self.selectedDate = [NSDate date];
}

#pragma mark - Action methods
- (IBAction)didTapPrevButton:(id)sender {
    self.selectedDate = [self.selectedDate monthAgoDate];
    
    [self.collectionView reloadData];
}

- (IBAction)didTapNextButton:(id)sender {
    self.selectedDate = [self.selectedDate monthLaterDate];
    
    [self.collectionView reloadData];
}

#pragma mark - private methods

- (void)setSelectedDate:(NSDate *)selectedDate {
    _selectedDate = selectedDate;

    // タイトルテキストを更新
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy/M";
    self.title = [formatter stringFromDate:selectedDate];
}

//該当月の1日の情報を取得する（※カレンダーが始まる場所を取得するため）
- (NSDate *)firstDateOfMonth {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                                                   fromDate:self.selectedDate];
    components.day = 1;
    
    NSDate *firstDateMonth = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    return firstDateMonth;
}


//セルの数を決める？
- (NSDate *)dateForCellAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger ordinalityOfFirstDay = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay
                                                                             inUnit:NSCalendarUnitWeekOfMonth
                                                                            forDate:self.firstDateOfMonth];
    
    // "day number of cell at indexPath" と "day number of first day"の違いを計算します。
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.day = indexPath.item - (ordinalityOfFirstDay - 1);
    
    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents
                                                                 toDate:self.firstDateOfMonth
                                                                options:0];
    return date;
}

#pragma mark - UICollectionViewDataSource methods
// CollectionView関係
- (NSInteger)collectionView:(UICollectionView *)collectionView
    // セクションのアイテムの数
     numberOfItemsInSection:(NSInteger)section {
    // 一週間の範囲を決める
    NSRange rangeOfWeeks = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth
                                                              inUnit:NSCalendarUnitMonth
                                                              forDate:self.firstDateOfMonth];
    //一週間の長さ
    NSUInteger numberOfWeeks = rangeOfWeeks.length;
    //アイテムの数は日にちの数
    NSInteger numberOfItems = numberOfWeeks * DaysPerWeek;
    
    return numberOfItems;
}

// Cellのアイテムを選択
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 日にちCell
    DayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier
                                                              forIndexPath:indexPath];
    //曜日ラベル初期定義
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"d";
    cell.label.text = [formatter stringFromDate:[self dateForCellAtIndexPath:indexPath]];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout methods
// CollectionViewのレイアウトを入れる
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // マージンのサイズ
    NSInteger numberOfMargin = 8;
    // 幅
    CGFloat width = floorf((collectionView.frame.size.width - CellMargin * numberOfMargin) / DaysPerWeek);
    //高さ
    CGFloat height = width * 1.5f;
    
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(CellMargin, CellMargin, CellMargin, CellMargin);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return CellMargin;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return CellMargin;
}

@end
