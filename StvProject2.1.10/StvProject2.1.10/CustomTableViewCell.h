//
//  CustomTableViewCell.h
//  StvProject2.1.10
//
//  Created by 竹本大地 on 2018/05/18.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property UIImage *image;

@end
