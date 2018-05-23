//
//  FavoriteProgrammingLanguage.m
//  StvProject1.1.5
//
//  Created by 竹本大地 on 2018/05/08.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import "FavoriteProgrammingLanguage.h"

@implementation FavoriteProgrammingLanguage

-(void)joinIntern{
    //memo メソッドを定義しつつ、プロパティに付与したプロトコルを埋め込む
    if ([self.delegate respondsToSelector:@selector(canObjc)]){
        NSLog(@"インターンに参加する！");
        [self.delegate canObjc];
    }
}

@end

//#import "FavoriteProgrammingLanguage.h"
//
//@protocol FavoriteProgrammingLanguageDelegate;//Delegate用のプロトコルを宣言
//
//@interface FavoriteProgrammingLanguage()
//
//@property (nonatomic, strong) NSString *FavoriteProgrammingLanguageString;
//
//@end
//
//@implementation FavoriteProgrammingLanguage
//
//- (void)joinIntern {
//
//        NSLog(@"インターンに参加する");
//    //canObjcを使うデリゲート//canObjcメソッドが呼び出せるかどうか
//    if ([self.delegate respondsToSelector:@selector(canObjc)])
//    {
////        NSString *toValue1 = *takeshi;
////        NSString *toValue2 = Account;
//
////        NSLog(@"Obj-Cが出来る");
////        [self.delegate canObjc : toValue1 : toValue2];
//        [self.delegate canObjc];
//    }
//}
//
//@end
//
