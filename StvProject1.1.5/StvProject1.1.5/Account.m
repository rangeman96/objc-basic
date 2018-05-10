//
//  Account.m
//  StvProject1.1.4
//
//  Created by 竹本大地 on 2018/05/02.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "Account.h"
#import "FavoriteProgrammingLanguage.h"

@interface Account () <FavoriteProgrammingLanguageDelegate> //プロトコルに準拠

@end

@implementation Account

- (id)initWithName:(NSString *)name age:(NSInteger)age sex:(NSString *)sex words:(NSString *)words {
    if (self = [super init]) {
        self.name = name;
        self.age = age;
        self.sex = sex;
        self.words = words;
    }
    return self;
}

- (void)printAccount {
    
    //インスタンス化( クラス名 *インスタンス名 ＝ [クラス名　new]; )
    FavoriteProgrammingLanguage *favoriteProgrammingLanguage = [FavoriteProgrammingLanguage new];
    
        //インターンを呼ぶ処理( インスタンス名 呼ぶメソッド名 )
        [favoriteProgrammingLanguage joinIntern];

    
    //([self.sex isEqual: @"man"]) = ([_sex isEqual: @"man"])
    if ([self.sex isEqual: @"man"]) {
        NSLog(@"%@君は、%@が得意な%ld歳です。", self.name, self.words, self.age);
    } else {
        NSLog(@"%@さんは、%@が得意な%ld歳です。", self.name, self.words, self.age);
        }
}
@end
