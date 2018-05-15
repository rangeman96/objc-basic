//
//  ViewController.h
//  StvProject2.1.6-2
//
//  Created by 竹本大地 on 2018/05/15.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>

@property IBOutlet UIWebView *webView;
@property (nonatomic, strong) UIAlertController *alertController;

@end

