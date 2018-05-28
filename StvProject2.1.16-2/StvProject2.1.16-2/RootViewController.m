//
//  RootViewController.m
//  StvProject2.1.16-2
//
//  Created by 竹本大地 on 2018/05/28.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "RootViewController.h"
#import "ContentViewController.h"

@interface RootViewController () <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageIndexStrings;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ベージコンテンツとして表示されるデータ
    self.pageIndexStrings = @[@"1Page", @"2Page", @"3Page", @"4Page"];
    
    // ページビューコントローラーを作成
    UIStoryboard *pageViewStoryboard = [UIStoryboard storyboardWithName:@"PageView" bundle:nil];
    self.pageViewController = [pageViewStoryboard instantiateInitialViewController];
    self.pageViewController.dataSource = self;
    
    // 最初のコンテンツページを作成
    ContentViewController *firstContentViewController = [self contentViewControllerAtIndex:0];
    NSArray *contentViewControllers = @[firstContentViewController];
    [self.pageViewController setViewControllers:contentViewControllers
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:NO
                                     completion:nil];
    
    // ページビューコントローラーを追加
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
}

#pragma mark Custom Methods

- (ContentViewController *)contentViewControllerAtIndex:(NSUInteger)index {
    // コンテンツページを作成
    UIStoryboard *contentViewStoryboard = [UIStoryboard storyboardWithName:@"ContentView" bundle:nil];
    ContentViewController *contentViewController = [contentViewStoryboard instantiateInitialViewController];
    
    // 値を代入
    contentViewController.labelText = self.pageIndexStrings[index];
    contentViewController.index = index;
    
    return contentViewController;
}

#pragma mark UIPageViewControllerDataSource Methods

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = ((ContentViewController *)viewController).index;
    // 前のページに戻る
    index--;
    if (index < 0) {
        return nil;
    } else {
        return [self contentViewControllerAtIndex:index];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = ((ContentViewController *)viewController).index;
    // 次のページに進む
    index++;
    if (index == self.pageIndexStrings.count) {
        return nil;
    } else {
        return [self contentViewControllerAtIndex:index];
    }
}

@end
