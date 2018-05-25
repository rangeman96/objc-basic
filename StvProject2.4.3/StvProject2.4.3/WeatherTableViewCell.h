//
//  WeatherTableViewCell.h
//  StvProject2.4.3
//
//  Created by 竹本大地 on 2018/05/25.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellTelop;
@property (weak, nonatomic) IBOutlet UILabel *cellText;
@property (weak, nonatomic) IBOutlet UIImageView *cellImg;

@end
