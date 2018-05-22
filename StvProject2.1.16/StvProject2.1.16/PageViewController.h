//
//  PageViewController.h
//  StvProject2.1.16
//
//  Created by 竹本大地 on 2018/05/22.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import <UIKit/UIKit.h>

// デリゲートを接続（UIPageViewController自体に関する設定はストーリーボードで）
@interface PageViewController : UIPageViewController <UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@end
