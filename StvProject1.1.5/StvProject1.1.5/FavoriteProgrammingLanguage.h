//
//  FavoriteProgrammingLanguage.h
//  StvProject1.1.5
//
//  Created by 竹本大地 on 2018/05/08.
//  Copyright © 2018年 Daichi Take. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FavoriteProgrammingLanguageDelegate <NSObject> //プロトコルを定義

@optional
   - (void)canObjc; //オプショナルを定義
@end

@interface  FavoriteProgrammingLanguage : NSObject

@property (nonatomic, weak) id<FavoriteProgrammingLanguageDelegate> delegate; //デリゲートインスタンスを定義
   - (void)joinIntern; //メソッドを宣言

@end
