//
//  FavoriteProgrammingLanguage.m
//  StvProject1.1.5-F
//
//  Created by 竹本大地 on 2018/05/23.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import "FavoriteProgrammingLanguage.h"

@implementation FavoriteProgrammingLanguage

- (void)doObjC: (NSString *)name{
    
    //delegateメソッドが@optionalなので、respondsToSelector で delegateオブジェクト が delegateメソッド を実装しているか判定する
    if ([self.delegate respondsToSelector:@selector(join:)]) {
        NSLog(@"Obj-Cができる");
        [self.delegate join:name];
    }
}

@end
