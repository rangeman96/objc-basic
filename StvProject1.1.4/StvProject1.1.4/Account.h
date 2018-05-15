//
//  Account.h
//  StvProject1.1.4
//
//  Created by 竹本大地 on 2018/05/02.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

@property  (nonatomic) NSString *name; //名前プロパティ定義
@property  (nonatomic) NSInteger age; //年齢プロパティ定義
@property  (nonatomic) NSString *sex; //性別プロパティ定義
@property  (nonatomic) NSString *words; //得意言語プロパティ定義

- (id) initWithName:(NSString *)name age:(NSInteger)age
                sex:(NSString *)sex words:(NSString *)words;//指定イニシャライザ

//メソッドを宣言
- (void) dasu;

//インスタンス生成 = initWithName = [[Account alloc] init];
//インスタンスをArrayで配列に入れる
//if文で条件分岐し出力する。
@end
