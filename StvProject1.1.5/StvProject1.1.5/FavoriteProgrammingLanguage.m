//
//  FavoriteProgrammingLanguage.m
//  StvProject1.1.5
//
//  Created by 竹本大地 on 2018/05/08.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "FavoriteProgrammingLanguage.h"

@protocol FavoriteProgrammingLanguageDelegate;//Delegate用のプロトコルを宣言

@interface FavoriteProgrammingLanguage()

@property (nonatomic, strong) NSString *FavoriteProgrammingLanguageString;

@end

@implementation FavoriteProgrammingLanguage

- (void)canObjc {
    NSLog(@"Obj-Cが出来る");
}

- (void)joinIntern {
         NSLog(@"インターンに参加する");
}

@end
