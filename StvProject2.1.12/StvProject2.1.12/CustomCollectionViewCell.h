//
//  CustomCollectionViewCell.h
//  StvProject2.1.12
//
//  Created by 竹本大地 on 2018/05/20.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell

//CellのCustomClassにCustomCollectionViewCellを指定しないと連結出来ない。
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end
