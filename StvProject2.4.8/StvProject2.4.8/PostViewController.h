//
//  PostViewController.h
//  StvProject2.4.8
//
//  Created by 竹本大地 on 2018/05/30.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostViewController : UIViewController <UIDocumentInteractionControllerDelegate>

+ (BOOL)diveInstagram;
- (void)setImage:(UIImage *)image;

@property (nonatomic, retain) UIDocumentInteractionController *interactionController;

@end
