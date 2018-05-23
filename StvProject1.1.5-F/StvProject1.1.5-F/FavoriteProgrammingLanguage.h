//
//  FavoriteProgrammingLanguage.h
//  StvProject1.1.5-F
//
//  Created by 竹本大地 on 2018/05/23.
//  Copyright © 2018年 Daichi.T96. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FavoriteProgrammingLanguageDelegate <NSObject>

@optional
// @optional以下のメソッドはdelegate準拠先での実装は必須ではなくなる。
// catchDelegate
- (void)join;

@end

@interface FavoriteProgrammingLanguage : NSObject

// デリゲートオブジェクト
@property (weak, nonatomic) id <FavoriteProgrammingLanguageDelegate> delegate;
// throwDelegate
- (void)doObjC;

@end
