//
//  Account.m
//  StvProject1.1.4
//
//  Created by 竹本大地 on 2018/05/02.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "Account.h"
#import "FavoriteProgrammingLanguage.h"

@implementation Account

- (id)initWithName:(NSString *)name
               age:(NSInteger)age
               sex:(NSString *)sex
             words:(NSString *)words{
    
    if (self = [super init]){
        self.name = name;
        self.age = age;
        self.sex = sex;
        self.words = words;
    }
    return self;
}

- (void)printAccount {
    if ([self.sex isEqual: @"man"]) {
        NSLog(@"%@君は、%@が得意な%ld歳です。", self.name, self.words, self.age);
    } else {
        NSLog(@"%@さんは、%@が得意な%ld歳です。", self.name, self.words, self.age);
    }
    //インスタンス化( クラス名 *インスタンス名 ＝ [クラス名　new]; )
    FavoriteProgrammingLanguage *favoriteProgrammingLanguage =
    [FavoriteProgrammingLanguage new];
    favoriteProgrammingLanguage.delegate = self; //デリゲートに設定している。設定しないと呼び出せない。
    [favoriteProgrammingLanguage joinIntern]; //クラスとメソッドを呼んでる//インターンを呼ぶ処理( インスタンス名 呼ぶメソッド名 )
}

- (void)canObjc {
    if ([self.sex isEqual: @"man"]){
        NSLog(@"%@君はObjective-Cができるで！", self.name);
    }else{
        NSLog(@"%@さんはObjective-Cができるで！", self.name);
    }
}

@end
