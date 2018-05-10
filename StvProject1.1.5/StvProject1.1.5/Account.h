//
//  Account.h
//  StvProject1.1.4
//
//  Created by 竹本大地 on 2018/05/02.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

@property  (nonatomic) NSString *name; //プロパティ定義
@property  (nonatomic) NSInteger age;
@property  (nonatomic) NSString *sex;
@property  (nonatomic) NSString *words;

- (id) initWithName:(NSString *)name age:(NSInteger)age
                sex:(NSString *)sex words:(NSString *)words; //指定イニシャライザ

- (void) printAccount; //メソッドを宣言

@end
